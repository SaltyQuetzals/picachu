# frozen_string_literal: true

Given(/^I'm logged in/) do
  visit root_path
  click_button('login_button')
  expect(page.current_path).to eq('/auth/google_oauth2')
  visit '/auth/google_oauth2'
  visit search_path
  expect(page).to have_content('James Doe')
end

Given(/^I'm not logged in/) do
  visit search_path
  expect(page).to have_content('Not Logged In')
end

And(/^I'm in the professor course overview page/) do
  visit professor_course_path(@review.professor_id, @review.course_id)
end

When(/^I click the upvote button/) do
  click_link('upvote_link_' + @review.id.to_s)
end

Then(/^I should see the number of upvotes equal to "([^"]*)"/) do |value|
  expect(page).to have_content('Upvotes: ' + value)
end

When(/^I click the downvote button/) do
  click_link('downvote_link_' + @review.id.to_s)
end

Then(/^I should see the number of downvotes equal to "([^"]*)"/) do |value|
  expect(page).to have_content('Downvotes: ' + value)
end
