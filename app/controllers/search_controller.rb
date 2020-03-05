# frozen_string_literal: true

class SearchController < ApplicationController
  def index; end

  def professors
    @search = ransack_params
    @professors = ransack_result
    render json: @professors
  end

  private

  def ransack_params
    Professor.ransack(params[:q])
  end

  def ransack_result
    @search.result
  end
end
