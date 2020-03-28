# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    overall_rating { 1 }
    letter_grade { 'A' }
    semester { 'Fall' }
    interesting { 1 }
    difficult { 1 }
    course_format { 'Exam' }
    cared_about_material { 1 }
    open_to_questions { 1 }
    cared_about_students { 1 }
    clear_grading { 1 }
    homework_heavy { 1 }
    clear_explanations { 1 }
    fast_grading { 1 }
    year { 2_020 }
    association :professor, factory: :professor
    association :course, factory: :course
  end
end
