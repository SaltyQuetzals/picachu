# frozen_string_literal: true

require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get search_url
    assert_response :success
  end

  test 'search should fetch only relevant results' do
    get search_professors_url, params: { q: { display_name_cont: 'John' } }
    json_response = JSON.parse(@response.body)
    assert_equal json_response.length, 1
  end
end
