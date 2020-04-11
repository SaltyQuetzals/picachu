# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :set_course, only: %i[show edit update destroy]
  before_action :set_professor

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def avg_rev(reviews)
    sum = 0
    reviews.each { |a| sum += a.overall_rating }
    sum.to_f / reviews.length
  end

  def show
    @avg_course =
      if @course.reviews.blank?
        0
      else
        @course.reviews.average(:overall_rating).round(2)
      end
    @grouped_prof = @course.reviews.group_by(&:professor)
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit; end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html do
          redirect_to @course, notice: 'Course was successfully created.'
        end
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json do
          render json: @course.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html do
          redirect_to @course, notice: 'Course was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json do
          render json: @course.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html do
        redirect_to courses_url, notice: 'Course was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  # GET /courses/search
  def search
    @search = ransack_params
    @courses = ransack_result
  end

  private

  def ransack_params
    Course.ransack(params[:q])
  end

  def ransack_result
    @search.result
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
  end

  def set_professor
    @professor = Professor.first
  end

  # Only allow a list of trusted parameters through.
  def course_params
    params.require(:course).permit(:dept, :course_num, :name)
  end
end
