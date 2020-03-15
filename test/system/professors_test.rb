require 'application_system_test_case'

class ProfessorsTest < ApplicationSystemTestCase
  setup { @professor = professors(:one) }

  test 'visiting the index' do
    visit professors_url
    assert_selector 'h1', text: 'Professors'
  end

  test 'creating a Professor' do
    visit professors_url
    click_on 'New Professor'

    fill_in 'Cv url', with: @professor.cv_url
    fill_in 'Display name', with: @professor.display_name
    fill_in 'First name', with: @professor.first_name
    fill_in 'Full name', with: @professor.full_name
    fill_in 'Last name', with: @professor.last_name
    fill_in 'Tamu dir dept', with: @professor.tamu_dir_dept
    fill_in 'Tamu dir email', with: @professor.tamu_dir_email
    fill_in 'Tamu dir title', with: @professor.tamu_dir_title
    click_on 'Create Professor'

    assert_text 'Professor was successfully created'
    click_on 'Back'
  end

  test 'updating a Professor' do
    visit professors_url
    click_on 'Edit', match: :first

    fill_in 'Cv url', with: @professor.cv_url
    fill_in 'Display name', with: @professor.display_name
    fill_in 'First name', with: @professor.first_name
    fill_in 'Full name', with: @professor.full_name
    fill_in 'Last name', with: @professor.last_name
    fill_in 'Tamu dir dept', with: @professor.tamu_dir_dept
    fill_in 'Tamu dir email', with: @professor.tamu_dir_email
    fill_in 'Tamu dir title', with: @professor.tamu_dir_title
    click_on 'Update Professor'

    assert_text 'Professor was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Professor' do
    visit professors_url
    page.accept_confirm { click_on 'Destroy', match: :first }

    assert_text 'Professor was successfully destroyed'
  end
end
