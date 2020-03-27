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

And(/^I fill in "([^"]*)" in the "Interesting" field$/) do |value|
  page.choose(:review_interesting_1)
end

And(/^I fill in "([^"]*)" in the "Difficult" field$/) do |value|
  page.choose(:review_difficult_1)
end

And(/^I fill in "([^"]*)" in the "Cared about material" field$/) do |value|
  page.choose(:review_cared_about_material_1)
end

And(/^I fill in "([^"]*)" in the "Open to questions" field$/) do |value|
  page.choose(:review_open_to_questions_1)
end

And(/^I fill in "([^"]*)" in the "Cared about students" field$/) do |value|
  page.choose(:review_cared_about_students_1)
end

And(/^I fill in "([^"]*)" in the "Clear grading" field$/) do |value|
  page.choose(:review_clear_grading_1)
end

And(/^I fill in "([^"]*)" in the "Homework heavy" field$/) do |value|
  page.choose(:review_homework_heavy_1)
end

And(/^I fill in "([^"]*)" in the "Clear explanations" field$/) do |value|
  page.choose(:review_clear_explanations_1)
end

And(/^I fill in "([^"]*)" in the "Fast grading" field$/) do |value|
  page.choose(:review_fast_grading_1)
end

And (/^I submit the Review form/) do
  click_button("commit")
end

Then (/^I should be redirected to the new Review page/) do
  expect(page.current_path)
end