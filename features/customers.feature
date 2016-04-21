Feature: Obtain information on the routes of railroad
  In order to know the best route
  I as customers
  I want to know the distance along a certain route,
  the number of different routes between two towns,
  and the shortest route between two towns

  Scenario: I want to know the distance along a certain route
    Given that I'm going to the city "A" passing through town "D" and stopping in the city "C"
    When entering the cities "A,D,C"
    Then I want to see the route distance

  Scenario: Number of different routes between two towns
    Given that I'm leaving the city "A" and then going to town "C"
    When entering the cities "A" and "C" with a maximum of 3 stops
    Then I want to know the amount of travel routes

  Scenario: Shortest route between two towns
    Given that I'm going from city "A" to city "D", I know the best route
    When entering the city "A" and the city "D"
    Then I want to see the route of shortest distance
