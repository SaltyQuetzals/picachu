Feature: Review Lock
  @javascript
  @omniauth_test
  Scenario: Check if review is locked on professor overview if not logged in
    Given I'm not logged in
    Given A professor exists in the database
    And I'm on the professor overview page
    Then I should see locked reviews


  @javascript
  @omniauth_test
  Scenario: Check if review is locked on professor course overview if not logged in
    Given I'm not logged in
    Given A professor exists in the database
    And The course exists
    And I'm on the professor course overview page
    Then I should see locked reviews


  @javascript
  @omniauth_test
  Scenario: Check if review is locked on professor overview if not logged in
    Given I'm logged in
    Given A professor exists in the database
    And The course exists
    And I'm on the professor overview page
    Then I should see locked reviews
    And I'm on the new review page
    And I select a professor
    And I select a course
    And I enter "5" in the "Overall rating" field
    And I enter "A" in the "Letter grade" field
    And I enter "Spring" in the "Semester" field
    And I enter "2019" in the "Year" field
    And I enter True in the "Course required" field
    And I enter "5" in the "Interesting" field
    And I enter "5" in the "Difficult" field
    And I enter True in the "Standardized course" field
    And I enter "5" in the "Course other thoughts" field
    And I enter True in the "Used Textbook" field
    And I enter True in the "Attendance mandatory" field
    And I enter "5" in the "Course format" field
    And I enter "5" in the "Cared about material" field
    And I enter "1" in the "Open to questions" field
    And I enter "1" in the "Cared about students" field
    And I enter "5" in the "Clear grading" field
    And I enter "5" in the "Homework heavy" field
    And I enter "5" in the "Clear explanations" field
    And I enter "5" in the "Fast grading" field
    And I enter "5" in the "Professor other thoughts" field
    When I submit my Review form
    Then I should be redirected to the Professor Course overview page
    Then I should not see locked reviews
