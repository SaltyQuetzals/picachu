require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  setup { 
    @review = reviews(:one)
    @professor = professors(:one)
    @course = courses(:one)
  }

  

  test 'should get new' do
    get new_professor_review_url(professor_id: @professor.id)
    assert_response :success
  end

  test 'should create review' do

    assert_difference('Review.count', 1) do
      # puts Review.count
      post professor_reviews_url(professor_id: @professor.id),
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
      # puts Review.count
    end

    assert_redirected_to professor_path(@professor)
  end



  test 'should update review' do
    patch professor_review_url(@review, professor_id: @professor.id),
          params: {
            review: {
              attendance_mandatory: @review.attendance_mandatory,
              cared_about_material: @review.cared_about_material,
              cared_about_students: @review.cared_about_students,
              clear_explanations: @review.clear_explanations,
              clear_grading: @review.clear_grading,
              course_format: @review.course_format,
              course_id: 5,
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
    assert_redirected_to professor_path(@professor)
  end

  test 'should destroy review' do

    # puts Review.count
    assert_difference('Review.count', -1) { delete professor_review_url(@review, professor_id: @professor.id) }
    # puts Review.count
    assert_redirected_to professor_path(@professor)
  end
end
