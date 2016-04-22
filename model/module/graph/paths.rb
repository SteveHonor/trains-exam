module Graph
  class Paths < Helper
    def find initial, final, distance, path=[], type
      traverse(initial, final, distance, path, type) do |initial, final, distance, path, type|
        if type == :maximum
          initial == final && path.length > 1
        else
          initial == final && path.length == distance + 1
        end
      end
    end

    def neighbors vertex
      neighbors = []

      @edges.get.each do |edge|
        neighbors.push edge[:final] if edge[:initial] == vertex
      end

      neighbors.uniq
    end

    private

    def traverse initial, final, distance, path=[], type, &block

      return [] unless @edges.include? initial

      path = path + [initial]

      paths = yield(initial, final, distance, path, type) ? [path] : []

      neighbors(initial).each do |neighbor|
        if path.length < distance + 1
          new_paths = traverse neighbor, final, distance, path, type, &block
          paths     = paths + new_paths
        end
      end

      paths
    end
  end
end
