require 'application_system_test_case'

class ReviewsTest < ApplicationSystemTestCase
  setup { @review = reviews(:one) }

  test 'visiting the index' do
    visit reviews_url
    assert_selector 'h1', text: 'Reviews'
  end

  test 'creating a Review' do
    visit reviews_url
    click_on 'New Review'

    check 'Attendance mandatory' if @review.attendance_mandatory
    fill_in 'Cared about material', with: @review.cared_about_material
    fill_in 'Cared about students', with: @review.cared_about_students
    fill_in 'Clear explanations', with: @review.clear_explanations
    fill_in 'Clear grading', with: @review.clear_grading
    fill_in 'Course format', with: @review.course_format
    fill_in 'Course', with: @review.course_id
    fill_in 'Course other thoughts', with: @review.course_other_thoughts
    check 'Course required' if @review.course_required
    fill_in 'Difficult', with: @review.difficult
    fill_in 'Fast grading', with: @review.fast_grading
    fill_in 'Homework heavy', with: @review.homework_heavy
    fill_in 'Interesting', with: @review.interesting
    fill_in 'Letter grade', with: @review.letter_grade
    fill_in 'Open to questions', with: @review.open_to_questions
    fill_in 'Overall rating', with: @review.overall_rating
    fill_in 'Professor', with: @review.professor_id
    fill_in 'Professor other thoughts', with: @review.professor_other_thoughts
    fill_in 'Semester', with: @review.semester
    check 'Standardized course' if @review.standardized_course
    check 'Used textbook' if @review.used_textbook
    fill_in 'Year', with: @review.year
    click_on 'Create Review'

    assert_text 'Review was successfully created'
    click_on 'Back'
  end

  test 'updating a Review' do
    visit reviews_url
    click_on 'Edit', match: :first

    check 'Attendance mandatory' if @review.attendance_mandatory
    fill_in 'Cared about material', with: @review.cared_about_material
    fill_in 'Cared about students', with: @review.cared_about_students
    fill_in 'Clear explanations', with: @review.clear_explanations
    fill_in 'Clear grading', with: @review.clear_grading
    fill_in 'Course format', with: @review.course_format
    fill_in 'Course', with: @review.course_id
    fill_in 'Course other thoughts', with: @review.course_other_thoughts
    check 'Course required' if @review.course_required
    fill_in 'Difficult', with: @review.difficult
    fill_in 'Fast grading', with: @review.fast_grading
    fill_in 'Homework heavy', with: @review.homework_heavy
    fill_in 'Interesting', with: @review.interesting
    fill_in 'Letter grade', with: @review.letter_grade
    fill_in 'Open to questions', with: @review.open_to_questions
    fill_in 'Overall rating', with: @review.overall_rating
    fill_in 'Professor', with: @review.professor_id
    fill_in 'Professor other thoughts', with: @review.professor_other_thoughts
    fill_in 'Semester', with: @review.semester
    check 'Standardized course' if @review.standardized_course
    check 'Used textbook' if @review.used_textbook
    fill_in 'Year', with: @review.year
    click_on 'Update Review'

    assert_text 'Review was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Review' do
    visit reviews_url
    page.accept_confirm { click_on 'Destroy', match: :first }

    assert_text 'Review was successfully destroyed'
  end
end
