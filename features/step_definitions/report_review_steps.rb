# frozen_string_literal: true

# Given(/^I'm viewing a specific review$/) { pending }

# When(/^I click the report button$/) { pending }

# And(/^I indicate that the review is spam or abusive$/) { pending }

# And(/^I submit my report$/) { pending }

# Then(/^I should receive confirmation that my report was successful$/) do
#   pending
# end

# And(/^I indicate that the review is inappropriate or offensive$/) { pending }

# And(/^I indicate that the review should be reported for other reasons$/) do
#   pending
# end

# And(/^I indicate it is "([^"]*)"$/) { |arg| }

# Then(/^I should get a notification that my report failed$/) { pending }


def fill_log_in_form
    fill_in 'tamu_email', with: 'xxx.tamu.edu'
    fill_in 'tamu_password', with: 'xxxtamupassword'
end

Given("I'm viewing a specific review") do
    visit professor_path
end

When("I choose the professor") do
    click_link 'show'
    visit professor_show_path
end

Then("I should see reviews for selected professor") do
    click_link 'show'
    visit review_show_path
end

AND("I should see report review click_button") do
	click_button "report review"
end

When("I click the report button") do
    expect("three radio buttons")
end

Then("I indicate that the review is spam or abusive") do
	click_button "submit"
end

Then("I should receive confirmation that my report was successful") do
    click_button "ok"
end

Then("I should be in the review page") do
  expect(page).to have_link('back')
end

AND("I indicate that the review should be reported for other reasons") do
	expect("input text box to be active")
end

When("I click the submit button") do
    expect("required notification in text input")
end

Then("I added 'it is vulgar' in input box") do
	click_button "submit"
end

Then("I should receive confirmation that my report was successful") do
    click_button "ok"
end

Then("I should be in the review page") do
  expect(page).to have_link('back')
end



