Feature: Create and submit reviews
  @javascript
  @omniauth_test
  Scenario: Submit a review without filling out required fields
    Given I'm logged in
    And My user data exists in the database
    And A professor exists in the database
    And The course exists
    And I'm on the new review page
    And I don't select a professor from the professor menu
    And I don't select a course from the course menu
    And I enter "5" in the "Overall rating" field
    And I enter "" in the "Letter grade" field
    And I enter "" in the "Semester" field
    And I enter "" in the "Year" field
    And I enter "" in the "Interesting" field
    And I enter "" in the "Difficult" field
    And I enter "" in the "Cared about material" field
    And I enter "" in the "Open to questions" field
    And I enter "" in the "Cared about students" field
    And I enter "" in the "Clear grading" field
    And I enter "" in the "Homework heavy" field
    And I enter "" in the "Clear explanations" field
    And I enter "" in the "Fast grading" field
    When I submit my Review form
    Then I should be redirected to the new Review page
