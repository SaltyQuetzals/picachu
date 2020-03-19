# frozen_string_literal: true

require 'test_helper'

class ProfessorsControllerTest < ActionDispatch::IntegrationTest
  setup { @professor = professors(:one) }

  test 'should get index' do
    get professors_url
    assert_response :success
  end

  test 'should get new' do
    get new_professor_url
    assert_response :success
  end

  test 'should create professor' do
    assert_difference('Professor.count') do
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
    end

    assert_redirected_to professor_url(Professor.last)
  end

  test 'should show professor' do
    get professor_url(@professor)
    assert_response :success
  end

  test 'should get edit' do
    get edit_professor_url(@professor)
    assert_response :success
  end

  test 'should update professor' do
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
    assert_redirected_to professor_url(@professor)
  end

  test 'should destroy professor' do
    assert_difference('Professor.count', -1) do
      delete professor_url(@professor)
    end

    assert_redirected_to professors_url
  end

  test 'should get search' do
    get search_professors_url,
        params: { q: { full_name_cont: @professor.first_name } }
    assert_response :success
  end
end
