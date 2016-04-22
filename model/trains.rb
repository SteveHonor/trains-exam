class Trains
  def initialize data
    @edges = Graph::Edges.new

    data.scan(/([A-Z])([A-Z])(\d+)/) do |initial, final, distance|
      @edges.connect initial, final, distance.to_i
    end

    @routes   = Graph::Routes.new(@edges)
    @path     = Graph::Paths.new(@edges)
    @distance = Graph::Distances.new(@edges, @routes, @path)
  end

  def calculate_distance_between *cities
    @routes.calculate_distance_between *cities
  end

  def find_routes initial, final, k, path=[], type
    @path.find(initial, final, k, path=[], type)
  end

  def find_routes_by_distance_less initial, final, w, path=[]
    @distance.find_by_distance_less initial, final, w, path=[]
  end

  def shortest_route initial, final
    @distance.shortest initial, final
  end
end
