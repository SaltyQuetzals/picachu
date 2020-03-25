Given(/^I'm on the new review page$/) do
  visit new_review_path
end


And(/^I select "([^"]*)" from the "Professor" menu$/) do |arg|
	select "Select a Professor", :from => 'professor_id'
	# select "Aakash Tyagi", :from => 'professor_id'

	# find('#professor_id').find(:xpath, "option[2]").select_option
	# find('#professor_id').find('option[value="958"]').select_option
	# within '#professor_id' do
	# 	find("option[value='958']").click
	# end
end

And(/^I select "([^"]*)" from the "Course" menu$/) do |value|
	find("#course_id").find(:xpath, "option[2]").select_option
end

And(/^I enter "([^"]*)" in the "Overall rating" field$/) do |value|
	find(:xpath, '//*[@id="review_overall_rating"]').set(value)
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

And(/^I enter "([^"]*)" in the "Interesting" field$/) do |value|
	find(:xpath, '//*[@id="review_interesting"]').set(value)
end

And(/^I enter "([^"]*)" in the "Difficult" field$/) do |value|
	find(:xpath, '//*[@id="review_difficult"]').set(value)
end

And(/^I enter "([^"]*)" in the "Standardized course" field$/) do |value|
	find(:xpath, '//*[@id="review_standardized_course"]').set(value)
end

And(/^I enter "([^"]*)" in the "Course other thoughts" field$/) do |value|
	find(:xpath, '//*[@id="review_course_other_thoughts"]').set(value)
end

And(/^I enter "([^"]*)" in the "Used Textbook" field$/) do |value|
	find(:xpath, '//*[@id="review_used_textbook"]').set(value)
end

And(/^I enter "([^"]*)" in the "Attendance mandatory" field$/) do |value|
	find(:xpath, '//*[@id="review_attendance_mandatory"]').set(value)
end

And(/^I enter "([^"]*)" in the "Course format" field$/) do |value|
	find(:xpath, '//*[@id="review_course_format"]').set(value)
end

And(/^I enter "([^"]*)" in the "Cared about material" field$/) do |value|
	find(:xpath, '//*[@id="review_cared_about_material"]').set(value)
end

And(/^I enter "([^"]*)" in the "Clear grading" field$/) do |value|
	find(:xpath, '//*[@id="review_clear_grading"]').set(value)
end

And(/^I enter "([^"]*)" in the "Homework heavy" field$/) do |value|
	find(:xpath, '//*[@id="review_homework_heavy"]').set(value)
end

And(/^I enter "([^"]*)" in the "Clear explanations" field$/) do |value|
	find(:xpath, '//*[@id="review_clear_explanations"]').set(value)
end

And(/^I enter "([^"]*)" in the "Fast grading" field$/) do |value|
	find(:xpath, '//*[@id="review_fast_grading"]').set(value)
end

And(/^I enter "([^"]*)" in the "Professor other thoughts" field$/) do |value|
	find(:xpath, '//*[@id="review_professor_other_thoughts"]').set(value)
end

And (/^I submit my Review form/) do
	click_button("commit")
end

Then (/^I should be redirected to the Professor overview page/) do
	expect(page.current_path).to eq(professor_path)
end