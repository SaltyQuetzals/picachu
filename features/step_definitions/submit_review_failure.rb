Given(/^I am on the new review page$/) do
  visit new_review_path
end


And(/^I select a professor from the professor menu$/) do
  find('#professor_id').find(:xpath, 'option[2]').select_option
end

And(/^I select a course from the course menu$/) do
  find('#course_id').find(:xpath, 'option[2]').select_option
end

And(/^I fill in "([^"]*)" in the "Overall rating" field$/) do |value|
  # find(:xpath, '//*[@id="review_overall_rating"]').set(value)
  page.choose(:review_overall_rating_1)
end

And(/^I fill in "([^"]*)" in the "Letter grade" field$/) do |value|
  find(:xpath, '//*[@id="review_letter_grade"]').set(value)
end

And(/^I fill in "([^"]*)" in the "Semester" field$/) do |value|
  find(:xpath, '//*[@id="review_semester"]').set(value)
end

And(/^I fill in "([^"]*)" in the "Year" field$/) do |value|
  find(:xpath, '//*[@id="review_year"]').set(value)
end

And (/^I submit the Review form/) do
  click_button("commit")
end

Then (/^I should be redirected to the new Review page/) do
  expect(page.current_path)
end