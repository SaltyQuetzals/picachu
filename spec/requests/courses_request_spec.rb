# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Courses', type: :request do
  fixtures :courses
  setup { @course = courses(:one) }

  it 'should get the index page' do
    get courses_url
    expect(response).to render_template(:index)
  end

  it 'should get the show page' do
    get course_url(@course)
    expect(response).to render_template(:show)
  end

  it 'should get the search page' do
    get search_courses_url, params: { q: { full_name_cont: @course.name } }
    expect(response).to have_http_status(:success)
  end
end
