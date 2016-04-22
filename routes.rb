#!/usr/bin/env ruby
# Gem byebug
require 'byebug'

# Require Decorator Pattern
require_relative "decorator/output_decorator"

# Require all files of path model
Dir[File.join("model/**/*.rb")].reverse.each do |file|
  require_relative file
end

# Trains Instance with graph
train ||= Trains.new "AB5, BC4, CD8, DC8, DE6, AD5, CE2, EB3, AE7"

# Print messages output decorated
OutputDecorator.new([
  train.calculate_distance_between('A', 'B', 'C'),
  train.calculate_distance_between('A', 'D'),
  train.calculate_distance_between('A', 'D', 'C'),
  train.calculate_distance_between('A', 'E', 'B', 'C', 'D'),
  train.calculate_distance_between('A', 'E', 'D'),
  train.find_routes('C', 'C', 3, :maximum).count,
  train.find_routes('A', 'C', 4, :exactly).count,
  train.shortest_route('A', 'C'),
  train.shortest_route('B', 'B'),
  train.find_routes_by_distance_less('C', 'C', 30).count
]).run
