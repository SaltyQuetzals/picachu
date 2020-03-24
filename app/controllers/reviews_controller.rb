# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :set_professor
  before_action :set_course
  before_action :set_review, only: %i[show edit update destroy]

  def sendemail
    val = session[:review]
    reportType = params[:rad]
    otherInput = params[:other_input]
    url = request.headers['HTTP_REFERER']
    profId = val.fetch('professor_id')
    reviewId = val.fetch('id')

    if reportType == nil
      redirect_to review_path(id: reviewId),
                  notice:
                    'Please select Radio Option while reporting review!!!.' and
        return
    elsif (reportType == 'otherReason' && otherInput == '')
      redirect_to review_path(id: reviewId),
                  notice: 'Please write description for selecting OTHER!!!.' and
        return
    else
      UserMailer.report_email(reportType, otherInput, url, profId, reviewId)
        .deliver_now
      redirect_to professor_path(profId), notice: 'Review Reported!!!!.' and
        return
    end
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

  # GET /reviews
  # GET /reviews.json
  def index; end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    session[:review] = @review
  end

  # GET /reviews/new
  def new
    @courses = Course.all.order(:dept, :course_num)
    @professors = Professor.all.order(:full_name)
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
    @courses = Course.all.order(:dept, :course_num)
    @course_id = @review.course_id
    @professors = Professor.all.order(:full_name)
    @professor_id = @review.professor_id
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    @review.professor_id = @professor.id
    @review.course_id = @course.id

    respond_to do |format|
      if @review.save
        format.html do
          redirect_to professor_path(@professor),
                      notice: 'Review was successfully created.'
        end
        format.json { render :show, status: :created, location: @review }
      else
        puts @review.errors.full_messages
        format.html { render :new }
        format.json do
          render json: @review.errors, status: :unprocessable_entity
        end
      end
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
        format.html { render :edit }
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

  def set_professor
    @professor = Professor.find(params[:professor_id]) if params[:professor_id]
  end

  def set_course
    @course = Course.find(params[:course_id]) if params[:course_id]
  end
end
