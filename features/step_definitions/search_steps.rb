# frozen_string_literal: true

Given(/^I'm on the search page$/) do
  visit search_path
end

And(/^I'm searching for courses$/) do
  find(:xpath, '//*[@id="labelCourse"]').click
end

When(/^I submit my course search query$/) do
  find(:xpath, '/html/body/div[2]/div/div[3]/form/button').click
end

Then(/^I should see course search results$/) do
  expect(page.current_path).to eq(search_courses_path)
end
