Then(/^I should see locked reviews$/) do
	expect(page).to have_content('Write a review to view other reviews')
end


And(/^I'm on the professor overview page$/) do
	visit professor_path(@professor)
end

And(/^I'm on the professor course overview page/) do
	visit professor_course_path(@professor, @course)
end

And(/^I'm on the course overview page/) do
	visit course_path(@course)
end

Then(/^I should see Report Review$/) do
	expect(page).to have_content('Report Review')
end

And(/^I should not see locked reviews$/) do
	page.should have_no_content('Write a review to view other reviews')
end