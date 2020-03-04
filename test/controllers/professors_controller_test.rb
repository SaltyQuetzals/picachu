# frozen_string_literal: true

require 'test_helper'

class ProfessorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @professor = professors(:one)
  end

  test 'should get index' do
    get professors_url, as: :json
    assert_response :success
  end

  test 'should create professor' do
    assert_difference('Professor.count') do
      post professors_url, params: { professor: { display_name: @professor.display_name, first_name: @professor.first_name, full_name: @professor.full_name, last_name: @professor.last_name, tamu_dir_dept: @professor.tamu_dir_dept, tamu_dir_email: @professor.tamu_dir_email, tamu_dir_title: @professor.tamu_dir_title } }, as: :json
    end

    assert_response 201
  end

  test 'should show professor' do
    get professor_url(@professor), as: :json
    assert_response :success
  end

  test 'should update professor' do
    patch professor_url(@professor), params: { professor: { display_name: @professor.display_name, first_name: @professor.first_name, full_name: @professor.full_name, last_name: @professor.last_name, tamu_dir_dept: @professor.tamu_dir_dept, tamu_dir_email: @professor.tamu_dir_email, tamu_dir_title: @professor.tamu_dir_title } }, as: :json
    assert_response 200
  end

  test 'should destroy professor' do
    assert_difference('Professor.count', -1) do
      delete professor_url(@professor), as: :json
    end

    assert_response 204
  end

  test 'should yield only matching professors in search results' do
    get search_professors_url, params: { q: { display_name_cont: 'Jo' } }
    json_response = JSON.parse(@response.body)
    assert_response :success
    assert_equal(json_response.length, 2)
  end
end
