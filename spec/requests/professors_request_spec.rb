# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Professors', type: :request do
  fixtures :professors, :courses
  setup do
    @professor = professors(:one)
    @course = courses(:one)
  end
  it 'should get the index page' do
    get professors_url
    expect(response).to have_http_status(:success)
  end

  it 'should get the show page' do
    get professor_url(@professor)
    expect(response).to have_http_status(:success)
  end

  it 'should get the show_course page' do
    get professor_course_url(@professor, @course)
    expect(response).to have_http_status(:success)
  end

  it 'should still get the show page even if no reviews exist' do
    second_professor = professors(:two)
    get professor_url(second_professor)
    expect(response).to have_http_status(:success)
  end

  it 'should get the search page' do
    get search_professors_url,
        params: { q: { full_name_cont: @professor.first_name } }
    expect(response).to have_http_status(:success)
  end
end
