# frozen_string_literal: true

Then(/^I should see locked reviews$/) do
  expect(page).to have_content('Review to View')
end

And(/^I'm on the professor overview page$/) { visit professor_path(@professor) }

And(/^I'm on the professor course overview page/) do
  visit professor_course_path(@professor, @course)
end

And(/^I'm on the course overview page/) { visit course_path(@course) }

Then(/^I should see Report Review$/) { expect(page).to have_content('Report') }

And(/^I should not see locked reviews$/) do
  expect(page).to have_no_content('Review to View')
end
