# frozen_string_literal: true

And(/^I don't select a professor from the professor menu$/) do
  find('#professor_id').find(:xpath, 'option[1]').select_option
end

And(/^I don't select a course from the course menu$/) do
  find('#course_id').find(:xpath, 'option[1]').select_option
end

Then (/^I should be redirected to the new Review page/) do
  expect(page.current_path).to eq(new_review_path)
end
