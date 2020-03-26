Feature: Reporting a Review
  @javascript
  Scenario: Successfully reporting a review as spam or abusive
    Given I'm viewing a specific review
    When I click the report button
    And I indicate that the review is spam or abusive
    And I submit my report
    Then I should receive confirmation that my report was successful

  @javascript
  Scenario: Successfully reporting a review as inappropriate or offensive
    Given I'm viewing a specific review
    When I click the report button
    And I indicate that the review is inappropriate or offensive
    And I submit my report
    Then I should receive confirmation that my report was successful

  @javascript
  Scenario: Successfully reporting a review for another reason
    Given I'm viewing a specific review
    When I click the report button
    And I indicate that the review should be reported for other reasons
    And I indicate it is "Unnecessarily aggressive"
    And I submit my report
    Then I should receive confirmation that my report was successful

  @javascript
  Scenario: Failing to report a review because no reason was selected
    Given I'm viewing a specific review
    When I click the report button
    And I submit my report
    Then I should get a notification that my report failed

  @javascript
  Scenario: Failing to report a review because no additional information was provided
    Given I'm viewing a specific review
    When I click the report button
    And I indicate that the review should be reported for other reasons
    And I submit my report
    Then I should get a notification that my report failed