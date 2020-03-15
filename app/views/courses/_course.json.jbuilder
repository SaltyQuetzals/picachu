# frozen_string_literal: true

json.extract! course, :id, :dept, :course_num, :name, :created_at, :updated_at
json.url course_url(course, format: :json)
