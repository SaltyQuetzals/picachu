And(/^I select a professor$/) do
  find('#professor_id').find(:xpath, 'option[2]').select_option
end

And(/^I select a course$/) do
  find('#course_id').find(:xpath, 'option[2]').select_option
end

Then (/^I should be redirected to the Professor overview page/) do
  expect(page.current_path).to eq(professor_path(@professor))
end