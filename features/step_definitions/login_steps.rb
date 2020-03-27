# frozen_string_literal: true

Given(/^I'm on the login page/) do
	visit root_path

  find(:xpath, '/html/body/div/div/a/button').click
end

Then(/^I should be redirected to the search page$/) do
	expect(page.current_path).to eq('/auth/google_oauth2')
	visit search_path
 	
    expect(page).to have_content("John Doe")
 	find(:xpath ,'/html/body/div/a[1]').click

 	expect(page).to have_link("Log Out", visible: false)

 	find(:xpath, '//*[@id="navUser"]').click
 	find(:xpath, '//*[@id="profileDropdown"]/a').click
	expect(page.current_path).to eq('/login')


end
	
