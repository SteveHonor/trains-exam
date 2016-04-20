Feature: Provide to my customers information about the routes
  In order to provide to my customers information about the routes
  I as railroad
  I want to be able to compute the distance along a certain route,
  the number of different routes between two towns,
  and the shortest route between two towns.

  Scenario: Compute the distance between cities "A,B,C"
    Given that I have the cities "A,B,C"
    When compute the distance between cities "A,B,C"
    Then it should display the following message: "Output # 1: 9"

  Scenario: Compute the distance between cities "A,D"
    Given that I have the cities "A,D"
    When compute the distance between cities "A,D"
    Then it should display the following message: "Output #2: 5"

  Scenario: Compute the distance between cities "A,D,C"
    Given that I have the cities "A,D,C"
    When compute the distance between cities "A,D,C"
    Then it should display the following message: "Output #3: 13"

  Scenario: Compute the distance between cities "A,E,B,C,D"
    Given that I have the cities "A,E,B,C,D"
    When compute the distance between cities "A,E,B,C,D"
    Then it should display the following message: "Output #4: 22"

  Scenario: Compute the distance between cities "A,E,D"
    Given that I have the cities "A,E,D"
    When compute the distance between cities "A,E,D"
    Then it should display the following message: "Output #5: NO SUCH ROUTE"

  Scenario: find all paths with a maximum of 3 stops
    Given the number of trips starting at "C" and ending at "C" with a maximum of 3 stops
    When compute the distance between cities "A,E,D"
    Then it should display the following message: "Output #6: 2"

  Scenario: find all paths exactly with exactly 4 stops
    Given the number of trips starting at A and ending at C with exactly 4 stops
    When compute the distance between cities "A,E,D"
    Then it should display the following message: "Output #7: 3"

  Scenario: Shortest route between two towns
    Given the length of the shortest route between cities "A,C"
    When compute the distance between cities "A,E,D"
    Then it should display the following message: "Output #8: 9"

  Scenario: Shortest route between two towns
    Given the length of the shortest route between cities "B,B"
    When compute the distance between cities "A,E,D"
    Then it should display the following message: "Output #9: 9"

  Scenario: Number of different routes between two towns with a distance of less than 30
    Given the number of different routes from C to C with a distance of less than 30
    When compute the distance between cities "A,E,D"
    Then it should display the following message: "Output #10: 7"
