# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :set_professor
  before_action :set_course
  before_action :set_review, only: %i[show edit update destroy]

  def upvote
    @review = Review.find(params[:review_id])
    if current_user.blank?
      redirect_to professor_course_path(
                    @review.professor_id,
                    @review.course_id
                  ),
                  notice: 'You must be logged in.'
    else
      if current_user.voted_up_for? @review
        @review.unliked_by current_user
      else
        @review.upvote_from current_user
      end
      redirect_to professor_course_path(@review.professor_id, @review.course_id)
    end
  end

  def downvote
    @review = Review.find(params[:review_id])
    if current_user.blank?
      redirect_to professor_course_path(
                    @review.professor_id,
                    @review.course_id
                  ),
                  notice: 'You must be logged in.'
    else
      if current_user.voted_down_for? @review
        @review.undisliked_by current_user
      else
        @review.downvote_from current_user
      end
      redirect_to professor_course_path(@review.professor_id, @review.course_id)
    end
  end

  def report
    @review = Review.find(params[:review_id])
    if (params[:reason].blank?)
      redirect_to review_path(@review),
                  notice: 'Unable to complete your request.'
    else
      reason = params[:reason]
      other_input = params[:other_input]

      url = review_path(@review.id)
      begin
        UserMailer.report_email(
          reason,
          other_input,
          url,
          @review.professor_id,
          @review.course_id
        )
          .deliver_now
      rescue StandardError
        redirect_to url, notice: 'Unable to complete your request.'
      else
        redirect_to url, notice: 'Review was successfully reported.'
      ensure

      end
    end
  end

  # GET /reviews
  # GET /reviews.json
  def index; end

  # GET /reviews/1
  # GET /reviews/1.json
  def show; end

  # GET /reviews/new
  def new
    if current_user.blank?
      redirect_to root_path, notice: 'You must be logged in to create a review.'
    else
      @courses = load_courses
      @professors = load_professors
      @review = Review.new
    end
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
      @review.course_id = params[:course_id]
      @review.professor_id = params[:professor_id]
      @review.authuser_id = current_user.id
      respond_to do |format|
        if @review.save
          format.html do
            redirect_to professor_course_path(
                          @review.professor_id,
                          @review.course_id
                        ),
                        notice: 'Review was successfully created.'
          end
          format.json { render :show, status: :created, location: @review }
        else
          @professors = load_professors
          @courses = load_courses
          format.html { render :new }
          format.json do
            render json: @review.errors, status: :unprocessable_entity
          end
        end
      end
    else
      redirect_to new_review_path, notice: 'Fill out all required fields'
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    if current_user.blank?
      redirect_to professor_course_path(
                    @review.professor_id,
                    @review.course_id
                  ),
                  notice: 'You must be
      logged in to update a review.'
    else
      @review.authuser_id = current_user.id
      respond_to do |format|
        if @review.update(review_params)
          format.html do
            redirect_to professor_course_path(
                          @review.professor_id,
                          @review.course_id
                        ),
                        notice: 'Review was successfully updated.'
          end
          format.json { render :show, status: :ok, location: @review }
        else
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
    unless params[:professor_id].blank?
      @professor = Professor.find(params[:professor_id])
    end
  end

  def set_course
    @course = Course.find(params[:course_id]) unless params[:course_id].blank?
  end

  def load_courses
    Course.all.order(:dept, :course_num)
  end

  def load_professors
    Professor.all.order(:full_name)
  end
end
