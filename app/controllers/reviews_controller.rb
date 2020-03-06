class ReviewsController < ApplicationController
  # def index; end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(params[:review])

    if(@review.save)
      flash[:notice] = "REVIEW SUBMITTED"
        if(@review.professor)
          redirect_to(@review.professor)
        else
          redirect_to(@review.course)
        end
    else
      flash[:notice] = "ERROR SUBMITTING REVIEW"
      if(@review.professor)
        redirect_to(@review.professor)
      else
        redirect_to(@review.course)
      end
    end
  end

  def edit
    @review = Review.find(params[:id])
    
  end

  def update
    @review = Review.find(params[:id])
    @review.update_attributes!(params[:review])
    flash[:notice] = "Review updated."
    if(@review.professor)
      redirect_to(@review.professor)
    else
      redirect_to(@review.course)
    end
  end


  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to(@review.professor)
  end
end