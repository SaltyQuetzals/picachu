require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @review = reviews(:one)
    @professor = professors(:one)
    @course = courses(:one)
  end

  test 'should get new' do
    get new_professor_course_review_url(
          professor_id: @professor.id, course_id: @course.id
        )
    assert_response :success
  end

  test 'should create review' do
    assert_difference('Review.count', 1) do
      # puts Review.count
      post professor_course_reviews_url(
             professor_id: @professor.id, course_id: @course.id
           ),
           params: {
             review: {
               attendance_mandatory: @review.attendance_mandatory,
               cared_about_material: @review.cared_about_material,
               cared_about_students: @review.cared_about_students,
               clear_explanations: @review.clear_explanations,
               clear_grading: @review.clear_grading,
               course_format: @review.course_format,
               course_id: @course.id,
               course_other_thoughts: @review.course_other_thoughts,
               course_required: @review.course_required,
               difficult: @review.difficult,
               fast_grading: @review.fast_grading,
               homework_heavy: @review.homework_heavy,
               interesting: @review.interesting,
               letter_grade: @review.letter_grade,
               open_to_questions: @review.open_to_questions,
               overall_rating: @review.overall_rating,
               professor_id: @professor.id,
               professor_other_thoughts: @review.professor_other_thoughts,
               semester: @review.semester,
               standardized_course: @review.standardized_course,
               used_textbook: @review.used_textbook,
               year: @review.year
             }
           }
    end

    assert_redirected_to professor_path(@professor)
  end

  test 'should update review' do
    patch professor_course_review_url(
            @review,
            professor_id: @professor.id, course_id: @course.id
          ),
          params: {
            review: {
              attendance_mandatory: @review.attendance_mandatory,
              cared_about_material: @review.cared_about_material,
              cared_about_students: @review.cared_about_students,
              clear_explanations: @review.clear_explanations,
              clear_grading: @review.clear_grading,
              course_format: @review.course_format,
              course_id: @course.id,
              course_other_thoughts: @review.course_other_thoughts,
              course_required: @review.course_required,
              difficult: @review.difficult,
              fast_grading: @review.fast_grading,
              homework_heavy: @review.homework_heavy,
              interesting: @review.interesting,
              letter_grade: @review.letter_grade,
              open_to_questions: @review.open_to_questions,
              overall_rating: @review.overall_rating,
              professor_id: @professor.id,
              professor_other_thoughts: @review.professor_other_thoughts,
              semester: 'test',
              standardized_course: @review.standardized_course,
              used_textbook: @review.used_textbook,
              year: @review.year
            }
          }
    assert_redirected_to professor_path(@professor)
  end

  test 'should destroy review' do
    # puts Review.count
    assert_difference('Review.count', -1) do
      delete professor_course_review_url(
               @review,
               professor_id: @professor.id, course_id: @course.id
             )
    end
    # puts Review.count
    assert_redirected_to professor_path(@professor)
  end
end
