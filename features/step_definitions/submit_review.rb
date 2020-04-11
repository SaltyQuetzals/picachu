# frozen_string_literal: true

Given(/^I'm on the new review page$/) { visit new_review_path }

And(/^I enter "([^"]*)" in the "Overall rating" field$/) do |value|
  page.choose('review_overall_rating_' + value) if !value.blank?
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
  find(:xpath, '//*[@id="review_course_required"]').set(value)
end

And(/^I enter True in the "Course required" field$/) do
  find(:xpath, '//*[@id="review_course_required"]').set(true)
end

And(/^I enter False in the "Course required" field$/) do
  find(:xpath, '//*[@id="review_course_required"]').set(false)
end

And(/^I enter "([^"]*)" in the "Interesting" field$/) do |value|
  page.choose('review_interesting_' + value) if !value.blank?
end

And(/^I enter "([^"]*)" in the "Difficult" field$/) do |value|
  page.choose('review_difficult_' + value) if !value.blank?
end

And(/^I enter "([^"]*)" in the "Standardized course" field$/) do |value|
  find(:xpath, '//*[@id="review_standardized_course"]').set(value)
end

And(/^I enter True in the "Standardized course" field$/) do
  find(:xpath, '//*[@id="review_standardized_course"]').set(true)
end

And(/^I enter False in the "Standardized course" field$/) do
  find(:xpath, '//*[@id="review_standardized_course"]').set(false)
end

And(/^I enter "([^"]*)" in the "Course other thoughts" field$/) do |value|
  find(:xpath, '//*[@id="review_course_other_thoughts"]').set(value)
end

And(/^I enter "([^"]*)" in the "Used Textbook" field$/) do |value|
  find(:xpath, '//*[@id="review_used_textbook"]').set(value)
end

And(/^I enter True in the "Used Textbook" field$/) do
  find(:xpath, '//*[@id="review_used_textbook"]').set(true)
end

And(/^I enter False in the "Used Textbook" field$/) do
  find(:xpath, '//*[@id="review_used_textbook"]').set(false)
end

And(/^I enter "([^"]*)" in the "Attendance mandatory" field$/) do |value|
  find(:xpath, '//*[@id="review_attendance_mandatory"]').set(value)
end

And(/^I enter True in the "Attendance mandatory" field$/) do
  find(:xpath, '//*[@id="review_attendance_mandatory"]').set(true)
end

And(/^I enter False in the "Attendance mandatory" field$/) do
  find(:xpath, '//*[@id="review_attendance_mandatory"]').set(false)
end

And(/^I enter "([^"]*)" in the "Course format" field$/) do |value|
  find(:xpath, '//*[@id="review_course_format"]').set(value)
end

And(/^I enter "([^"]*)" in the "Cared about material" field$/) do |value|
  page.choose('review_cared_about_material_' + value) if !value.blank?
end

And(/^I enter "([^"]*)" in the "Open to questions" field$/) do |value|
  page.choose('review_open_to_questions_' + value) if !value.blank?
end

And(/^I enter "([^"]*)" in the "Cared about students" field$/) do |value|
  page.choose('review_cared_about_students_' + value) if !value.blank?
end

And(/^I enter "([^"]*)" in the "Clear grading" field$/) do |value|
  page.choose('review_clear_grading_' + value) if !value.blank?
end

And(/^I enter "([^"]*)" in the "Homework heavy" field$/) do |value|
  page.choose('review_homework_heavy_' + value) if !value.blank?
end

And(/^I enter "([^"]*)" in the "Clear explanations" field$/) do |value|
  page.choose('review_clear_explanations_' + value) if !value.blank?
end

And(/^I enter "([^"]*)" in the "Fast grading" field$/) do |value|
  page.choose('review_fast_grading_' + value) if !value.blank?
end

And(/^I enter "([^"]*)" in the "Professor other thoughts" field$/) do |value|
  find(:xpath, '//*[@id="review_professor_other_thoughts"]').set(value)
end

And (/^I submit my Review form/) do
  click_button('commit')
end
