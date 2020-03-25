Feature: Create and submit reviews
  Scenario: Successfully create a review for Aakash Tyagi's ACCT 209 course
  	Given I'm on the new review page
  	And I select "Aakash Tyagi" from the "Professor" menu
  	And I select "ACCT, 209, Survey of Accounting Principles" from the "Course" menu
  	And I enter "5" in the "Overall rating" field
  	And I enter "A" in the "Letter grade" field
  	And I enter "Spring" in the "Semester" field
  	And I enter "2019" in the "Year" field
  	And I enter "True" in the "Course required" field
  	And I enter "5" in the "Interesting" field
  	And I enter "5" in the "Difficult" field
  	And I enter "True" in the "Standardized course" field
  	And I enter "5" in the "Course other thoughts" field
  	And I enter "True" in the "Used Textbook" field
  	And I enter "True" in the "Attendance mandatory" field
  	And I enter "5" in the "Course format" field
  	And I enter "5" in the "Cared about material" field
  	And I enter "5" in the "Clear grading" field
  	And I enter "5" in the "Homework heavy" field
  	And I enter "5" in the "Clear explanations" field
  	And I enter "5" in the "Fast grading" field
  	And I enter "5" in the "Professor other thoughts" field
  	And I submit my Review form
  	Then I should be redirected to the Professor overview page 
