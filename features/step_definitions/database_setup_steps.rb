# frozen_string_literal: true

Given(/^A professor exists in the database$/) do
  @professor = FactoryBot.create(:professor)
end

Given(
  /^A professor exists in the database with first name "([^"]*)" and last name "([^"]*)"$/
) do |arg1, arg2|
  @professor = FactoryBot.create(:professor, first_name: arg1, last_name: arg2)
end

Given(/^The course exists$/) { @course = FactoryBot.create(:course) }

Given(
  /^A course exists in the database with department "([^"]*)", course number "([^"]*)", and name "([^"]*)"$/
) do |arg1, arg2, arg3|
  @course = FactoryBot.create(:course, dept: arg1, course_num: arg2, name: arg3)
end

Given(/^A review exists in the database$/) do
  @review = FactoryBot.create(:review)
end

Given(/^My user data exists in the database$/) { FactoryBot.create(:authuser) }