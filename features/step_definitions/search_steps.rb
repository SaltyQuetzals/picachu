Given(/^I'm on the search page$/) do
  visit search_path
  # print page.body
end

When(/^I'm searching for courses$/) do
  find(:xpath, '//*[@id="labelCourse"]').click
end

And(/^I enter "([^"]*)" into the course search bar$/) do |arg|
  find(:xpath, '//*[@id="courseID"]').set(arg)
end

And(/^I submit my course search query$/) do
  find(:xpath, '/html/body/div[2]/div/div[3]/form/button').click
end

Then(/^I should be redirected to the search results page$/) do
  expect(page.current_path).to eq(search_courses_path)
end
