Given(/^that I'm going to the city "([^"]*)" passing through town "([^"]*)" and stopping in the city "([^"]*)"$/) do |city_1, city_2, city_3|
  cities = city_1,city_2,city_3

  validate_cities cities.join(',')
end

When(/^entering the cities "([^"]*)"$/) do |cities|
  @result = @train.calculate_distance_between *cities.split(',')
end

Then(/^I want to see the route distance$/) do
  expect(@result).to be_kind_of(Integer)
end

Given(/^that I'm leaving the city "([^"]*)" and then going to town "([^"]*)"$/) do |first_city, last_city|
cities = first_city,last_city

validate_cities cities.join(',')
end

When(/^entering the cities "([^"]*)" and "([^"]*)" with a maximum of (\d+) stops$/) do |first_city, last_city, stop|
  @result = @train.find_routes(first_city, last_city, stop.to_i, :maximum).count
end

Then(/^I want to know the amount of travel routes$/) do
  expect(@result).to be_kind_of(Integer)
end

Given(/^that I'm going from city "([^"]*)" to city "([^"]*)", I know the best route$/) do |first_city, last_city|
  cities = first_city,last_city

  validate_cities cities.join(',')
end

When(/^entering the city "([^"]*)" and the city "([^"]*)"$/) do |first_city, last_city|
  @result = @train.shortest_route(first_city, last_city)
end

Then(/^I want to see the route of shortest distance$/) do
  expect(@result).to be_kind_of(Integer)
end
