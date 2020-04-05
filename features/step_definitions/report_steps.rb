# frozen_string_literal: true

Given(/^I'm viewing a specific review$/) { visit review_path(@review) }

When(/^I click the report button$/) { click_button('open-modal-btn') }

When(/^I indicate that the review is spam or abusive$/) { page.choose('spam') }

When(/^I submit my report$/) { click_button('reportReview') }

Then(/^I should receive confirmation that my report was successful$/) do
  expect(page.current_path).to eq(review_path(@review))
end

Given(/^I'm viewing a specific review$/) { visit review_path(@review) }

When(/^I indicate that the review is inappropriate or offensive$/) do
  page.choose('inappropriate')
end

When(/^I indicate that the review should be reported for other reasons$/) do
  page.choose('other')
end

When(/^I indicate it is "([^"]*)"$/) { |arg| find('#reasonForOther').set(arg) }

Then(/^I should get a notification that my report failed$/) do
  expect(page.current_path).to eq(review_path(@review))
end
