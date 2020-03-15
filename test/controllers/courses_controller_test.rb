# frozen_string_literal: true

require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  setup { @course = courses(:one) }

  test 'should get index' do
    get courses_url
    assert_response :success
  end

  test 'should get new' do
    get new_course_url
    assert_response :success
  end

  test 'should create course' do
    dept = 'TEST'
    course_num = '221'
    name = 'Name 121'
    assert_difference('Course.count') do
      post courses_url,
           params: {
             course: { course_num: course_num, dept: dept, name: name }
           }
    end

    assert_redirected_to course_url(Course.last)
  end

  test 'should show course' do
    get course_url(@course)
    assert_response :success
  end

  test 'should get edit' do
    get edit_course_url(@course)
    assert_response :success
  end

  test 'should update course' do
    patch course_url(@course),
          params: {
            course: {
              course_num: @course.course_num,
              dept: @course.dept,
              name: @course.name
            }
          }
    assert_redirected_to course_url(@course)
  end

  test 'should destroy course' do
    assert_difference('Course.count', -1) { delete course_url(@course) }

    assert_redirected_to courses_url
  end

  test 'search should fetch only relevant results' do
    get search_courses_url, params: { q: { full_name_cont: @course.name } }
    json_response = JSON.parse(@response.body)
    assert_equal json_response.length, 1
  end

  test 'search should be case-insensitive' do
    get search_courses_url,
        params: { q: { full_name_cont: @course.name.downcase } }
    json_response = JSON.parse(@response.body)
    assert_equal json_response.length, 1
  end
end
