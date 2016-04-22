Given(/^that I have the cities "([^"]*)"$/) do | cities |
  validate_cities cities
end

When(/^compute the distance between cities "([^"]*)"$/) do | cities |
  @result = @train.calculate_distance_between *cities.split(',')
end

Then(/^it should display the following output: "([^"]*)"$/) do | message |
  expect(message).to eq(@result.to_s)
end

Given(/^the number of trips starting at "([^"]*)" and ending at "([^"]*)" with a maximum of (\d+) stops$/) do |first, last, stops|
  expect(first).to      eq("C")
  expect(last).to       eq("C")
  expect(stops.to_i).to eq(3)
end

When(/^compute the distance between cities "([^"]*)" and "([^"]*)" with a maximum of (\d+) stops$/) do |first, last, stops|
  @result = @train.find_routes(first, last, stops.to_i, :maximum).count
end

Given(/^the number of trips starting at "([^"]*)" and ending at "([^"]*)" with exactly (\d+) stops$/) do |first, last, stops|
  expect(first).to      eq("A")
  expect(last).to       eq("C")
  expect(stops.to_i).to eq(4)
end

When(/^compute the distance between cities "([^"]*)" and "([^"]*)" with exactly (\d+) stops$/) do |first, last, stops|
  @result = @train.find_routes(first, last, stops.to_i, :exactly).count
end

Given(/^the length of the shortest route between cities "([^"]*)"$/) do |cities|
  validate_cities cities
end

When(/^compute the shortest distance between cities "([^"]*)" and "([^"]*)"$/) do |first, last|
  @result = @train.shortest_route(first, last)
end

Given(/^the number of different routes from cities "([^"]*)"$/) do |cities|
  validate_cities cities
end

When(/^compute the distance between cities "([^"]*)" to "([^"]*)" with a distance of less than (\d+)$/) do |first, last, distance|
  @result = @train.find_routes_by_distance_less(first, last, distance.to_i).count
end
