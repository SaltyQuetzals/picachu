Given(/^I'm on the new review page$/) { visit new_review_path}


And(/^I enter "([^"]*)" in the "Overall rating" field$/) do |_value|
  page.choose(:review_overall_rating_1)
end

And(/^I enter "([^"]*)" in the "Letter grade" field$/) do |value|
  find(:xpath, '//*[@id="review_letter_grade"]').set(value)
end

And(/^I enter "([^"]*)" in the "Semester" field$/) do |value|
  find(:xpath, '//*[@id="review_semester"]').set(value)
end

And(/^I enter "([^"]*)" in the "Year" field$/) do |value|
  find(:xpath, '//*[@id="review_year"]').set(value)
end

And(/^I enter "([^"]*)" in the "Course required" field$/) do |value|
  check 'review_course_required'
end

And(/^I enter "([^"]*)" in the "Interesting" field$/) do |_value|
  page.choose(:review_interesting_1)
end

And(/^I enter "([^"]*)" in the "Difficult" field$/) do |_value|
  page.choose(:review_difficult_1)
end

And(/^I enter "([^"]*)" in the "Standardized course" field$/) do |value|
  uncheck 'review_standardized_course'
end

And(/^I enter "([^"]*)" in the "Course other thoughts" field$/) do |value|
  find(:xpath, '//*[@id="review_course_other_thoughts"]').set(value)
end

And(/^I enter "([^"]*)" in the "Used Textbook" field$/) do |value|
  check 'review_used_textbook'
end

And(/^I enter "([^"]*)" in the "Attendance mandatory" field$/) do |value|
  check 'review_attendance_mandatory'
end

And(/^I enter "([^"]*)" in the "Course format" field$/) do |value|
  find(:xpath, '//*[@id="review_course_format"]').set(value)
end

And(/^I enter "([^"]*)" in the "Cared about material" field$/) do |_value|
  page.choose(:review_cared_about_material_1)
end

And(/^I enter "([^"]*)" in the "Open to questions" field$/) do |_value|
  page.choose(:review_open_to_questions_1)
end

And(/^I enter "([^"]*)" in the "Cared about students" field$/) do |_value|
  page.choose(:review_cared_about_students_1)
end

And(/^I enter "([^"]*)" in the "Clear grading" field$/) do |_value|
  page.choose(:review_clear_grading_1)
end

And(/^I enter "([^"]*)" in the "Homework heavy" field$/) do |_value|
  page.choose(:review_homework_heavy_1)
end

And(/^I enter "([^"]*)" in the "Clear explanations" field$/) do |_value|
  page.choose(:review_clear_explanations_1)
end

And(/^I enter "([^"]*)" in the "Fast grading" field$/) do |_value|
  page.choose(:review_fast_grading_1)
end

And(/^I enter "([^"]*)" in the "Professor other thoughts" field$/) do |value|
  find(:xpath, '//*[@id="review_professor_other_thoughts"]').set(value)
end

And (/^I submit my Review form/) do
  click_button('commit')
end
