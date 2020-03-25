Given(/^A professor exists in the database$/) do
  @professor = create(:professor)
end

Given(
  /^A professor exists in the database with first name "([^"]*)" and last name "([^"]*)"$/
) do |arg1, arg2|
  @professor = create(:professor, first_name: arg1, last_name: arg2)
end

Given(/^A course exists in the database$/) { @course = create(:course) }

Given(
  /^A course exists in the database with department "([^"]*)", course number "([^"]*)", and name "([^"]*)"$/
) do |arg1, arg2, arg3|
  @course = create(:course, dept: arg1, course_num: arg2, name: arg3)
end


Given(/^A review exists in the database$/) do
  @review = create(:review)
end