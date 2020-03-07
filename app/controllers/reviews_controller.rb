class ReviewsController < ApplicationController
  before_action :find_review, only: [:show, :edit, :update, :destroy]
  before_action :find_professor

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.professor_id = @professor.id

    if(@review.save)
      flash[:notice] = "REVIEW SUBMITTED"
      redirect_to professor_path(@professor)
    else
      render 'new'
    end
  end



  def update
    if(@review.update(review_params))
      redirect_to professor_path(@professor)
    else
      render 'edit'
    end
  end


  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to(@review.professor)
  end
end


private

  def review_params
    params.require(:review).permit(:overall_rating, :letter_grade, :semester,
    :year, :used_textbook, :course_format, :cared_about_material, :open_to_questions,
    :cared_about_students, :clear_grading, :homework_heavy, :clear_explanations,
    :fast_grading, :professor_other_thoughts)
  end

  def find_professor
    @professor = Professor.find(params[:professor_id])
  end

  def find_review
    @review = Review.find(params[:id])
  end