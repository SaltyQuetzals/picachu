# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    overall_rating { 1 }
    letter_grade { 'A' }
    semester { 'Fall' }
    year { 2_020 }
    association :professor, factory: :professor
    association :course, factory: :course
  end
end
