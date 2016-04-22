require 'spec_helper'

describe Graph::Distances do
  describe "#Shortest" do

    before do
       data = "AB5, BC4, CD8, DC8, DE6, AD5, CE2, EB3, AE7"

       @edges = Graph::Edges.new

       data.scan(/([A-Z])([A-Z])(\d+)/) do |initial, final, distance|
         @edges.connect initial, final, distance.to_i
       end

       @routes   = Graph::Routes.new(@edges)
       @path     = Graph::Paths.new(@edges)
       @distance = Graph::Distances.new(@edges, @routes, @path)
    end

    describe "Shortest route between two towns" do
      it "shortest distance between 'A', 'C'" do
        expect(@distance.shortest('A', 'C')).to eq(9)
      end

      it "shortest invalid distance between 'F', 'C'" do
        expect(@distance.shortest('F', 'C')).to eq(Float::INFINITY)
      end
    end
  end
end
