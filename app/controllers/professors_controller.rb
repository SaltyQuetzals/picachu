# frozen_string_literal: true

class ProfessorsController < ApplicationController
  before_action :set_professor, only: %i[show edit update destroy]
  before_action :set_course, only: %i[show_course]
  # GET /professors
  # GET /professors.json
  def index
    @professors = Professor.all.order(:full_name)
  end

  # GET /professors/1
  # GET /professors/1.json
  def show
    @avg_review =
      if @professor.reviews.blank?
        0
      else
        @professor.reviews.average(:overall_rating)
      end

    @num_reviews = @professor.reviews.length # does not work
    @grouped_courses = @professor.reviews.group_by(&:course)
    @courses_with_ratings =
      @grouped_courses.map do |course, reviews|
        [course, reviews.sum(&:overall_rating).to_f / reviews.length]
      end

    @highest_rated_course, _rating =
      @courses_with_ratings.max { |a, b| a[1] <=> b[1] } # does not work so well

    if (!@highest_rated_course.blank? && !@highest_rated_course.reviews.blank?)
      @highest_rated_course_review =
        @highest_rated_course.reviews.order('overall_rating').first
    end

    @lowest_rated_course, _rating =
      @courses_with_ratings.min { |a, b| a[1] <=> b[1] }

    if (!@lowest_rated_course.blank? && !@lowest_rated_course.reviews.blank?)
      @lowest_rated_course_review =
        @lowest_rated_course.reviews.order('overall_rating DESC').first
    end

    # Need overall review rating of particular course caught by the professor
  end

  # GET /professors/1/courses/1
  # GET /professors/1/courses/1.json
  def show_course
    @professor = Professor.find(params[:professor_id])
    @grouped_courses = @professor.reviews.group_by(&:course)
    @course_reviews = @professor.reviews.where(course_id: @course.id)
  end

  # GET /professors/new
  def new
    @professor = Professor.new
  end

  # GET /professors/1/edit
  def edit; end

  # POST /professors
  # POST /professors.json
  def create
    @professor = Professor.new(professor_params)

    respond_to do |format|
      if @professor.save
        format.html do
          redirect_to @professor, notice: 'Professor was successfully created.'
        end
        format.json { render :show, status: :created, location: @professor }
      else
        format.html { render :new }
        format.json do
          render json: @professor.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /professors/1
  # PATCH/PUT /professors/1.json
  def update
    respond_to do |format|
      if @professor.update(professor_params)
        format.html do
          redirect_to @professor, notice: 'Professor was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @professor }
      else
        format.html { render :edit }
        format.json do
          render json: @professor.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /professors/1
  # DELETE /professors/1.json
  def destroy
    @professor.destroy
    respond_to do |format|
      format.html do
        redirect_to professors_url,
                    notice: 'Professor was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  # GET /professors/search
  def search
    @search = ransack_params
    @professors = ransack_result
  end

  private

  def ransack_params
    Professor.ransack(params[:q])
  end

  def ransack_result
    @search.result
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_professor
    @professor = Professor.find(params[:id])
  end

  def set_course
    @course = Course.find(params[:course_id])
  end

  # Only allow a list of trusted parameters through.
  def professor_params
    params.require(:professor).permit(
      :first_name,
      :last_name,
      :full_name,
      :display_name,
      :cv_url,
      :tamu_dir_title,
      :tamu_dir_dept,
      :tamu_dir_email
    )
  end
end
