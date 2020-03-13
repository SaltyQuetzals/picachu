# frozen_string_literal: true

require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @review = reviews(:one)
    @professor = professors(:one)
  end

  test 'should get new' do
    get new_professor_review_url(professor_id: @professor.id)
    assert_response :success
  end

  test 'should create review' do
    assert_difference('Review.count', 1) do
      post professor_reviews_url(professor_id: @professor.id), params: {review: {
          overall_rating: @review.overall_rating,
          letter_grade: @review.letter_grade,
          semester: @review.semester,
          year: @review.year,
          used_textbook: @review.used_textbook,
          course_format: @review.course_format,
          open_to_questions: @review.open_to_questions,
          cared_about_students: @review.cared_about_students,
          clear_grading: @review.clear_grading,
          homework_heavy: @review.homework_heavy,
          clear_explanations: @review.clear_explanations,
          fast_grading: @review.fast_grading,
          professor_other_thoughts: @review.professor_other_thoughts
      }}
    end

    assert_redirected_to professor_path(Review.last.professor_id)
  end
end
