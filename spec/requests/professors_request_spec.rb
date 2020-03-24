# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Professors', type: :request do
  fixtures :professors
  setup { @professor = professors(:one) }
  it 'should get the index page' do
    get professors_url
    expect(response).to have_http_status(:success)
  end

  it 'should get the new page' do
    get new_professor_url
    expect(response).to have_http_status(:success)
  end

  it 'should create a new professor' do
    expect {
      post professors_url,
           params: {
             professor: {
               cv_url: @professor.cv_url,
               display_name: @professor.display_name,
               first_name: @professor.first_name,
               full_name: @professor.full_name,
               last_name: @professor.last_name,
               tamu_dir_dept: @professor.tamu_dir_dept,
               tamu_dir_email: @professor.tamu_dir_email,
               tamu_dir_title: @professor.tamu_dir_title
             }
           }
    }.to change { Professor.count }.by(1)
  end

  it 'should get the show page' do
    get professor_url(@professor)
    expect(response).to have_http_status(:success)
  end

  it 'should get the edit page' do
    get edit_professor_url(@professor)
    expect(response).to have_http_status(:success)
  end

  it 'should update a professor' do
    patch professor_url(@professor),
          params: {
            professor: {
              cv_url: @professor.cv_url,
              display_name: @professor.display_name,
              first_name: @professor.first_name,
              full_name: @professor.full_name,
              last_name: @professor.last_name,
              tamu_dir_dept: @professor.tamu_dir_dept,
              tamu_dir_email: @professor.tamu_dir_email,
              tamu_dir_title: @professor.tamu_dir_title
            }
          }
    expect(response).to redirect_to(professor_url(@professor))
  end

  it 'should destroy a professor' do
    expect { delete professor_url(@professor) }.to change {
      Professor.count
    }.by(-1)
  end

  it 'should get the search page' do
    get search_professors_url,
        params: { q: { full_name_cont: @professor.first_name } }
    expect(response).to have_http_status(:success)
  end
end
