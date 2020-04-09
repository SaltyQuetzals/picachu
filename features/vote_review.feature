Feature: Rate Reviews
  @javascript
  @omniauth_test
  Scenario: Successfully upvote a review
    Given I'm logged in
    And My user data exists in the database
    And A review exists in the database
    And I'm in the professor course overview page
    Given A professor exists in the database
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
    When I click the upvote button
    Then I should see the number of upvotes equal to "1"


  @javascript
  @omniauth_test
  Scenario: Successfully downvote a review
    Given I'm logged in
    And My user data exists in the database
    And A review exists in the database
    And I'm in the professor course overview page
    Given I'm logged in
    And My user data exists in the database
    And I'm in the professor course overview page
    Given A professor exists in the database
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
    When I click the downvote button
    Then I should see the number of downvotes equal to "1"



  @javascript
  @omniauth_test
  Scenario: Successfully undo an upvote a review
    Given I'm logged in
    And My user data exists in the database
    And A review exists in the database
    And I'm in the professor course overview page
    Given I'm logged in
    And My user data exists in the database
    And I'm in the professor course overview page
    Given A professor exists in the database
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
    When I click the upvote button
    Then I should see the number of upvotes equal to "1"
    When I click the upvote button
    Then I should see the number of upvotes equal to "0"


  @javascript
  @omniauth_test
  Scenario: Successfully undo a downvote review
    Given I'm logged in
    And My user data exists in the database
    And A review exists in the database
    And I'm in the professor course overview page
    Given I'm logged in
    And My user data exists in the database
    And I'm in the professor course overview page
    Given A professor exists in the database
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
    When I click the downvote button
    Then I should see the number of downvotes equal to "1"
    When I click the downvote button
    Then I should see the number of downvotes equal to "0"

