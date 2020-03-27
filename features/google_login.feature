Feature: Google Login
  @javascript
  @omniauth_test
  Scenario: Log in to Picachu
    Given I'm on the login page
    When I click the login button
    Then I should be redirected to the search page