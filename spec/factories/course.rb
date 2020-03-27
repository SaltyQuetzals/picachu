# frozen_string_literal: true

FactoryBot.define do
  factory :course do
    dept { 'CSCE' }
    course_num { '121' }
    name { 'Introduction to Programming Concepts' }
  end
end
