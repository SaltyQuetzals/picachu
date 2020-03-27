Feature: Professor and Course Search
  @javascript
  Scenario: Search for 121
    Given I'm on the search page
    And I'm searching for courses
    And I enter "121" into the course search bar
    When I submit my course search query
    Then I should see course search results