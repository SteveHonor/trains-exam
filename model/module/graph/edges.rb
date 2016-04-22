module Graph
  class Edges < Array
    def initialize
      @edges = []
    end

    def find initial, final
      @edges.find do |edge|
        edge[:initial] == initial && edge[:final] == final
      end
    end

    def add initial, final, distance
      @edges.push initial: initial, final: final, distance: distance
    end

    def get
      @edges
    end

    def connect initial, final, distance = 1
      push initial unless self.include? initial
      push final   unless self.include? final

      if edge = find(initial, final)
        edge.distance = distance
      else
        add initial, final, distance
      end
    end
  end
end
