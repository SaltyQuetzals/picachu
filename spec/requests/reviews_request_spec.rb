# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

RSpec.describe 'Reviews', type: :request do
  fixtures :courses, :professors, :reviews
  setup do
    @review = reviews(:one)
    @professor = professors(:one)
    @course = courses(:one)


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
   Rails.application.env_config['omniauth.auth'] = auth


  end

  it 'should report the review' do
    expect {
      post review_report_path(@review),
           params: { reason: 'other', other_input: 'Its really bad' }
    }.to change { ActionMailer::Base.deliveries.count }.by(1)
  end


  it 'should upvote a review' do
  end

  it 'should downvote a review' do
  end

  it 'should undo an upvote' do
  end

  it 'should undo a downvote' do
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
    # auth = {
    #   provider: 'google',
    #   uid: '12345',
    #   info:{
    #     name: 'John Doe',
    #     email: 'test_user@tester.com',
    #     location: 'test_location',
    #     image: 'test_image_url'
    #   },
    #   extra:{
    #     raw_info:{
    #       hd: 'tamu.edu'
    #     }
    #   }
    # }

      # Authuser.find_or_create_from_auth_hash(stub_omiauth)

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
               year: @review.year,
             },
             course_id: @course.id,
             professor_id: @professor.id,
           }
    }.to change { Review.count }.by(1)

    expect(response).to redirect_to(professor_url(@professor.id))
    follow_redirect!

    expect(response).to render_template(:show)
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
                         year: @review.year,
                         authuser_id: @authuser.id
                       }
                     }
    expect(response).to redirect_to(professor_url(@professor))
    @review.reload
    expect(@review.semester).to eq new_semester
  end

  it 'should destroy a review' do
    expect { delete review_url @review }.to change { Review.count }.by(-1)
    expect(response).to redirect_to professor_url(@professor)
  end
end
