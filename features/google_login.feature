Feature: Google Login
  @javascript
  @omniauth_test
  Scenario: Log in to Picachu
    Given I'm on the login page
    When I click the login button
    Then I should see the Google authentication page

  @javascript
  @omniauth_test
  Scenario: Logged In Successfully
    Given My user data exists in the database
    And I am signed in with Google
    And I'm on the search page
    Then I should see that I am logged in