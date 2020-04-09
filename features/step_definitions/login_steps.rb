# frozen_string_literal: true

Given(/^I'm on the login page/) { visit root_path }

When(/^I click the login button/) do
  # find(:xpath, '/html/body/div/div/a/button').click
  click_button('login_button')
end

Then(/^I should see the Google authentication page$/) do
  expect(page.current_path).to eq('/auth/google_oauth2')
end

Given(/^I am signed in with Google$/) { visit '/auth/google_oauth2' }

Then(/^I should see that I am logged in$/) do
  visit search_path
  expect(page).to have_content('James Doe')
end
