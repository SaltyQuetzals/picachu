# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Courses', type: :request do
  fixtures :courses
  setup { @course = courses(:one) }

  it 'should get the index page' do
    get courses_url
    expect(response).to render_template(:index)
  end

  it 'should get the new page' do
    get new_course_url
    expect(response).to render_template(:new)
  end

  it 'should create a new course' do
    dept = 'TEST'
    course_num = '221'
    name = 'Name 121'
    expect {
      post courses_url,
           params: {
             course: { course_num: course_num, dept: dept, name: name }
           }
    }.to change { Course.count }.by(1)
    expect(response).to redirect_to(course_url(Course.last))
    follow_redirect!

    expect(response).to render_template(:show)
    expect(flash[:notice]).to_not be nil
  end

  it 'should get the show page' do
    get course_url(@course)
    expect(response).to render_template(:show)
  end

  it 'should get the edit page' do
    get edit_course_url(@course)
    expect(response).to render_template(:edit)
  end

  it 'should update a course' do
    patch course_url(@course),
          params: {
            course: {
              course_num: @course.course_num,
              dept: @course.dept,
              name: @course.name
            }
          }
    expect(response).to redirect_to(course_url(@course))
  end

  it 'should destroy a course' do
    expect { delete course_url(@course) }.to change { Course.count }.by(-1)

    expect(response).to redirect_to(courses_url)
  end

  it 'should get the search page' do
    get search_courses_url, params: { q: { full_name_cont: @course.name } }
    expect(response).to have_http_status(:success)
  end
end
