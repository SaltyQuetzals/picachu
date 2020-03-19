# frozen_string_literal: true

json.extract! review, :id, :overall_rating, :letter_grade, :semester, :year, :course_required, :interesting, :difficult, :standardized_course, :course_other_thoughts, :used_textbook, :attendance_mandatory, :course_format, :cared_about_material, :open_to_questions, :cared_about_students, :clear_grading, :homework_heavy, :clear_explanations, :fast_grading, :professor_other_thoughts, :professor_id, :course_id, :created_at, :updated_at
json.url review_url(review, format: :json)
