module Graph
  class Distances
    def initialize edges, routes, paths
      @edges  = edges
      @routes = routes
      @paths  = paths
    end

    # dijkstra
    # http://en.wikipedia.org/wiki/Dijkstra's_algorithm#Pseudocode
    def shortest initial, final
      distances = Hash.new Float::INFINITY
      edges     = @edges.clone

      attribute_neighbor initial, final, distances

      until edges.empty?
        nearest = edges.min_by do |vertex|
          distances[vertex]
        end

        edges.delete nearest

        break if distances[nearest] == Float::INFINITY

        @paths.neighbors(nearest).each do |vertex|
          if (new_distance = distances[nearest] + @routes.calculate_distance_between(nearest, vertex)) < distances[vertex]
            distances[vertex] = new_distance
          end
        end
      end

      distances[final]
    end

    def find_by_distance_less initial, final, distance, path=[]
      path += [initial]

      return [] unless initial

      paths = get_path path, final, distance

      @paths.neighbors(initial).each do |neighbor|
        if valid_distance? path, initial, neighbor, distance
          new_paths = find_by_distance_less neighbor, final, distance, path
          paths    += new_paths
        end
      end

      paths
    end

    private

    def valid_distance? path, initial, neighbor, distance
      @routes.calculate_distance_between(*path) +
      @routes.calculate_distance_between(initial, neighbor) < distance
    end

    def get_path path, final, distance
      path.length > 1 && path[-1] == final && @routes.calculate_distance_between(*path) < distance ? [path] : []
    end

    def attribute_neighbor initial, final, distances
      if initial == final
        @paths.neighbors(initial).each do |neighbor|
          distances[neighbor] = @routes.calculate_distance_between initial, neighbor
        end
      else
        distances[initial] = 0
      end
    end
  end
end
