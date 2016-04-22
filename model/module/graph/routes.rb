module Graph
  class Routes < Helper
    def calculate_distance_between *nodes
      distance = 0

      while (node = nodes.shift) && nodes.length > 0
        edge = @edges.find node, nodes.first

        return 'NO SUCH ROUTE' unless edge

        distance += edge[:distance]
      end

      distance
    end
  end
end
