Feature: Create and submit reviews

Scenario: Submit a review without filling out required fields
    Given A professor exists in the database
    And The course exists
    And I am on the new review page
    And I select a professor from the professor menu
    And I select a course from the course menu
    And I fill in "5" in the "Overall rating" field
    And I fill in "" in the "Letter grade" field
    And I fill in "" in the "Semester" field
    And I fill in "" in the "Year" field
    And I fill in "" in the "Interesting" field
    And I fill in "" in the "Difficult" field
    And I fill in "" in the "Cared about material" field
    And I fill in "" in the "Open to questions" field
    And I fill in "" in the "Cared about students" field
    And I fill in "" in the "Clear grading" field
    And I fill in "" in the "Homework heavy" field
    And I fill in "" in the "Clear explanations" field
    And I fill in "" in the "Fast grading" field 
    When I submit the Review form
    Then I should be redirected to the new Review page
