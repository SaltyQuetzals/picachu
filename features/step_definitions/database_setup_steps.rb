Given(/^A professor exists in the database$/) do
<<<<<<< HEAD
  @professor = create(:professor)
=======
  @professor = FactoryBot.create(:professor)
>>>>>>> master
end

Given(
  /^A professor exists in the database with first name "([^"]*)" and last name "([^"]*)"$/
) do |arg1, arg2|
<<<<<<< HEAD
  @professor = create(:professor, first_name: arg1, last_name: arg2)
end

Given(/^A course exists in the database$/) { @course = create(:course) }
=======
  @professor = FactoryBot.create(:professor, first_name: arg1, last_name: arg2)
end

Given(/^The course exists$/) { @course = FactoryBot.create(:course) }
>>>>>>> master

Given(
  /^A course exists in the database with department "([^"]*)", course number "([^"]*)", and name "([^"]*)"$/
) do |arg1, arg2, arg3|
<<<<<<< HEAD
  @course = create(:course, dept: arg1, course_num: arg2, name: arg3)
=======
  @course = FactoryBot.create(:course, dept: arg1, course_num: arg2, name: arg3)
>>>>>>> master
end


Given(/^A review exists in the database$/) do
<<<<<<< HEAD
  @review = create(:review)
=======
  @review = FactoryBot.create(:review)
>>>>>>> master
end