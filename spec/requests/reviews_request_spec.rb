# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

RSpec.describe 'Reviews', type: :request do
  fixtures :courses, :professors, :reviews
  setup do
    @review = reviews(:one)
    @professor = professors(:one)
    @course = courses(:one)
  end

  before do
    auth = {
      'provider' => 'google',
      'uid' => '12345',
      'info' => {
        'name' => 'John Doe',
        'email' => 'johndoe@doe.com',
        'location' => 'Doe World',
        'image' => 'image_url'
      },
      'extra' => { 'raw_info' => { 'hd' => '@tamu.edu' } }
    }

    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google] = auth
    Rails.application.env_config['omniauth.auth'] =
      OmniAuth.config.mock_auth[:google]
    post sessions_path
  end

  it 'should report the review' do
    expect {
      post review_report_path(@review),
           params: { reason: 'other', other_input: 'Its really bad' }
    }.to change { ActionMailer::Base.deliveries.count }.by(1)
  end

  it 'should upvote a review' do
    expect { put review_upvote_path(@review) }.to change {
      @review.get_upvotes.size
    }.by(1)
  end

  it 'should downvote a review' do
    expect { put review_downvote_path(@review) }.to change {
      @review.get_downvotes.size
    }.by(1)
  end

  it 'should undo an upvote' do
    expect { put review_upvote_path(@review) }.to change {
      @review.get_upvotes.size
    }.by(1)

    expect { put review_upvote_path(@review) }.to change {
      @review.get_upvotes.size
    }.by(-1)
  end

  it 'should undo a downvote' do
    expect { put review_downvote_path(@review) }.to change {
      @review.get_downvotes.size
    }.by(1)

    expect { put review_downvote_path(@review) }.to change {
      @review.get_downvotes.size
    }.by(-1)
  end

  it 'should get the new page' do
    get new_review_url
    expect(response).to have_http_status(:success)
  end

  it 'should get the edit page' do
    get edit_review_url(@review)
    expect(response).to have_http_status(:success)
  end

  it 'should create a new review' do
    expect {
      post reviews_url,
           params: {
             review: {
               attendance_mandatory: @review.attendance_mandatory,
               cared_about_material: @review.cared_about_material,
               cared_about_students: @review.cared_about_students,
               clear_explanations: @review.clear_explanations,
               clear_grading: @review.clear_grading,
               course_format: @review.course_format,
               course_other_thoughts: @review.course_other_thoughts,
               course_required: @review.course_required,
               difficult: @review.difficult,
               fast_grading: @review.fast_grading,
               homework_heavy: @review.homework_heavy,
               interesting: @review.interesting,
               letter_grade: @review.letter_grade,
               open_to_questions: @review.open_to_questions,
               overall_rating: @review.overall_rating,
               professor_other_thoughts: @review.professor_other_thoughts,
               semester: @review.semester,
               standardized_course: @review.standardized_course,
               used_textbook: @review.used_textbook,
               year: @review.year
             },
             course_id: @course.id,
             professor_id: @professor.id
           }
    }.to change { Review.count }.by(1)

    expect(response).to redirect_to(
      professor_course_path(@professor.id, @course.id)
    )
    follow_redirect!

    expect(flash[:notice]).to_not be nil
  end

  it 'should update a review' do
    new_semester = 'Fall'
    patch review_url @review,
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
                         professor_other_thoughts:
                           @review.professor_other_thoughts,
                         semester: new_semester,
                         standardized_course: @review.standardized_course,
                         used_textbook: @review.used_textbook,
                         year: @review.year
                       }
                     }
    expect(response).to redirect_to(professor_course_path(@professor, @course))
    @review.reload
    expect(@review.semester).to eq new_semester
  end

  it 'should destroy a review' do
    expect { delete review_url @review }.to change { Review.count }.by(-1)
    expect(response).to redirect_to professor_url(@professor)
  end
end
