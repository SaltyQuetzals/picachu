Given(/^I'm logged in/) {
  visit root_path
  find(:xpath, '/html/body/div/div/a/button').click
  expect(page.current_path).to eq('/auth/google_oauth2')
  visit '/auth/google_oauth2'
  visit search_path
  expect(page).to have_content('James Doe')
}

Given(/^I'm not logged in/){
  visit search_path
  expect(page).to have_content('Not Logged In')
}

And(/^I'm in the professor course overview page/){
  visit professor_course_path(@review.professor_id, @review.course_id)
}

When(/^I click the upvote button/){
  click_link('upvote_link_' + @review.id.to_s )
}

Then(/^I should see the number of upvotes equal to "([^"]*)"/) do |value|
  expect(page).to have_content("Upvotes: " + value)
end

When(/^I click the downvote button/){
  click_link('downvote_link_' + @review.id.to_s)
}

Then(/^I should see the number of downvotes equal to "([^"]*)"/) do |value|
  expect(page).to have_content("Downvotes: " + value)
end
