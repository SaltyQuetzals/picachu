RSpec.feature "user logs in" do
  scenario "using google oauth2" do
    stub_omniauth
    visit root_path
    expect(page).to have_link("Log In to Your Account")
    click_link "Log In to Your Account"
    expect(page).to have_link("Log Out")
    expect(page).to have_content("John Dos")
  end