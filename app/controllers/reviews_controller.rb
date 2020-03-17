class ReviewsController < ApplicationController
  before_action :set_professor
  before_action :set_course
  before_action :set_review, only: %i[show edit update destroy]

  # GET /reviews
  # GET /reviews.json
  def index; end

  # GET /reviews/1
  # GET /reviews/1.json
  def show; end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit; end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    @review.professor_id = @professor.id
    @review.course_id = @course.id

    # puts @review.inspect

    respond_to do |format|
      if @review.save
        format.html do
          redirect_to professor_path(@professor),
                      notice: 'Review was successfully created.'
        end
        format.json { render :show, status: :created, location: @review }
      else
        # puts @review.errors.full_messages
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
          redirect_to professor_path(@professor),
                      notice: 'Review was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @review }
      else
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
    @review.destroy
    respond_to do |format|
      format.html do
        redirect_to professor_path(@professor),
                    notice: 'Review was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = @professor.reviews.find(params[:id])
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
      :professor_other_thoughts
    )
    # :professor_id,
    # :course_id
  end

  def set_professor
    @professor = Professor.find(params[:professor_id])
  end

  def set_course
    @course = Course.first
  end
end
