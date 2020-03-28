
# frozen_string_literal: true

Given(/^I'm viewing a specific review$/) { visit review_path(@review) }

When(/^I click the report button$/) { click_button('open-modal-btn') }

And(/^I indicate that the review is spam or abusive$/) { page.choose('spam') }

And(/^I submit my report$/) do
  click_button('reportReview')
end

Then(/^I should receive confirmation that my report was successful$/) do
  accept_alert(wait: 10) do
    expect(page.current_path).to eq(review_path(@review))
  end
end

And(/^I indicate that the review is inappropriate or offensive$/) do
  page.choose('inappropriate')
end

And(/^I indicate that the review should be reported for other reasons$/) do
  page.choose('other')
end

And(/^I indicate it is "([^"]*)"$/) { |arg| find('#reasonForOther').set(arg) }

Then(/^I should get a notification that my report failed$/) do
  expect('report failure notification')
end
