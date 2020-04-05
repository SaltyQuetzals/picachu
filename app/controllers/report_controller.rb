# frozen_string_literal: true

class ReportController < ApplicationController
  def report_params
    params.require(:report).permit(:id)
  end

  def index
    @id = params[:id]
  end

  def reportReview
    @review = Review.find(params[:id])
    reason = params[:reason]
    other_input = params[:other_input]
    if reason.blank?
      render json: 'You must select a reason for reporting.',
             status: :bad_request
      return
    end

    url = reviews_path(@review.id)

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

    redirect_to review_path(@review.id),
                notice: 'Review was successfully updated.'
  end
end
