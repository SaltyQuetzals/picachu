Feature: Rate Reviews
  @javascript
  @omniauth_test
  Scenario: Successfully upvote a review
    Given I'm logged in
    And My user data exists in the database
    And A review exists in the database
    And I'm in the professor course overview page
    When I click the upvote button
    Then I should see the number of upvotes equal to "1"


  @javascript
  @omniauth_test
  Scenario: Successfully downvote a review
    Given I'm logged in
    And My user data exists in the database
    And A review exists in the database
    And I'm in the professor course overview page
    When I click the downvote button
    Then I should see the number of downvotes equal to "1"



  @javascript
  @omniauth_test
  Scenario: Successfully undo an upvote a review
    Given I'm logged in
    And My user data exists in the database
    And A review exists in the database
    And I'm in the professor course overview page
    When I click the upvote button
    When I click the upvote button
    Then I should see the number of upvotes equal to "0"


  @javascript
  @omniauth_test
  Scenario: Successfully undo a downvote review
    Given I'm logged in
    And My user data exists in the database
    And A review exists in the database
    And I'm in the professor course overview page
    When I click the downvote button
    When I click the downvote button
    Then I should see the number of downvotes equal to "0"

  @javascript
  @omniauth_test
  Scenario: Fail to vote if not logged in
    Given I'm not logged in
    And A review exists in the database
    And I'm in the professor course overview page
    When I click the upvote button
    Then I should see the number of upvotes equal to "0"
