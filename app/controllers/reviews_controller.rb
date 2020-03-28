# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :set_professor
  before_action :set_course
  before_action :set_review, only: %i[show edit update destroy report]

  def report

    reason = params[:reason]
    other_input = params[:other_input]
    if reason.blank?
      render json: 'You must select a reason for reporting.',
             status: :bad_request
      return
    end

    url = review_path(@review.id)

    if reason == 'other' && other_input.blank?
      render json:
               'You must provide more information when reporting for "Other" reasons.',
             status: :bad_request
      return
    end



    UserMailer.report_email(
      reason,
      other_input,
      url,
      @review.professor_id,
      @review.course_id
    ).deliver_now
    render json: 'Review reported successfully.'
  end

  # GET /reviews
  # GET /reviews.json
  def index; end

  # GET /reviews/1
  # GET /reviews/1.json
  def show; end

  # GET /reviews/new
  def new
    @courses = load_courses
    @professors = load_professors
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
    @courses = load_courses
    @course_id = @review.course_id
    @professors = load_professors
    @professor_id = @review.professor_id
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)

    if !params[:course_id].blank? && !params[:professor_id].blank?
      @review.course_id = params[:course_id] if @review.course_id.nil?
      @review.professor_id = params[:professor_id] if @review.professor_id.nil?

      respond_to do |format|
        if @review.save
          format.html do
            redirect_to professor_path(@review.professor_id),
                        notice: 'Review was successfully created.'
          end
          format.json { render :show, status: :created, location: @review }
        else
          format.html { render :new }
          format.json do
            render json: @review.errors, status: :unprocessable_entity
          end
        end
      end
    else
      redirect_to new_review_path, alert: 'Fill out all required fields'
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html do
          redirect_to professor_path(@review.professor_id),
                      notice: 'Review was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @review }
      else
        puts @review.errors.full_messages
        format.html do
          @courses = load_courses
          @professors = load_professors
          render :edit
        end
        format.json do
          render json: @review.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    prof_id = @review.professor_id
    @review.destroy
    respond_to do |format|
      format.html do
        redirect_to professor_path(prof_id),
                    notice: 'Review was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def review_params
    params.require(:review).permit(
      :overall_rating,
      :letter_grade,
      :semester,
      :year,
      :course_required,
      :interesting,
      :difficult,
      :standardized_course,
      :course_other_thoughts,
      :used_textbook,
      :attendance_mandatory,
      :course_format,
      :cared_about_material,
      :open_to_questions,
      :cared_about_students,
      :clear_grading,
      :homework_heavy,
      :clear_explanations,
      :fast_grading,
      :professor_other_thoughts,
      :professor_id,
      :course_id
    )
  end

  def set_professor
    if !params[:professor_id].blank?
      @professor = Professor.find(params[:professor_id])
    end
  end

  def set_course
    @course = Course.find(params[:course_id]) if !params[:course_id].blank?
  end

  def load_courses
    Course.all.order(:dept, :course_num)
  end

  def load_professors
    Professor.all.order(:full_name)
  end
end
