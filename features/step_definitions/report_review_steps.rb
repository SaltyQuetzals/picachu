# frozen_string_literal: true

Given(/^I'm viewing a specific review$/) { visit review_path(@review) }

When(/^I click the report button$/) { click_button('open-modal-btn') }

And(/^I indicate that the review is spam or abusive$/) do |arg|
  page.choose(:reason_spamAbusive)
end

And(/^I submit my report$/) { click_button('reportReview') }

Then(/^I should receive confirmation that my report was successful$/) do
  expect('report success notification')
  expect(page.current_path).to eq(review_path(@review))
end

And(/^I click the report button$/) { click_button('open-modal-btn') }

And(/^I indicate that the review is inappropriate or offensive$/) do |arg|
  page.choose(:reason_inappropriateOffensive)
end

And(
  /^I indicate that the review should be reported for other reasons$/
) { |arg| page.choose(:reason_other) }

And(/^I indicate it is "([^"]*)"$/) do |arg|
  find(:xpath, '//*[@id="other_input"]').set(arg)
end

Then(/^I should get a notification that my report failed$/) do
  expect('report failure notification')
end
