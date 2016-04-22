require 'spec_helper'

describe Trains do
  describe "#Output" do

    before do
       @trains = Trains.new "AB5, BC4, CD8, DC8, DE6, AD5, CE2, EB3, AE7"
    end

    describe "calculate distance" do
      it "between nodes 'A', 'B', 'C'" do
        expect(@trains.calculate_distance_between('A', 'B', 'C')).to eq(9)
      end

      it "between nodes 'A', 'D'" do
        expect(@trains.calculate_distance_between('A', 'D')).to eq(5)
      end

      it "between nodes 'A', 'D', 'C'" do
        expect(@trains.calculate_distance_between('A', 'D', 'C')).to eq(13)
      end

      it "between nodes 'A', 'E', 'B', 'C', 'D'" do
        expect(@trains.calculate_distance_between('A', 'E', 'B', 'C', 'D')).to eq(22)
      end

      it "between nodes 'A', 'E', 'D'" do
        expect(@trains.calculate_distance_between('A', 'E', 'D')).to eq("NO SUCH ROUTE")
      end
    end

    describe "Number of different routes between two towns" do
      it "with a maximum of 3 stops" do
        expect(@trains.find_routes('C', 'C', 3, :maximum).count).to eq(2)
      end

      it "with exactly 4 stops" do
        expect(@trains.find_routes('A', 'C', 4, :exactly).count).to eq(3)
      end
    end

    describe "Shortest route between two towns" do
      it "route of shortest distance between 'A', 'C'" do
        expect(@trains.shortest_route('A', 'C')).to eq(9)
      end

      it "route of shortest distance between 'B', 'B'" do
        expect(@trains.shortest_route('B', 'B')).to eq(9)
      end

      it "route of shortest distance between 'C', 'C' and with a distance of less than 30" do
        expect(@trains.find_routes_by_distance_less('C', 'C', 30).count).to eq(7)
      end
    end
  end
end
