Feature: Courses are searchable
  @javascript
  Scenario: Search for 121
    Given I'm on the search page
    When I'm searching for courses
    And I enter "121" into the course search bar
    And I submit my course search query
    Then I should see course search results