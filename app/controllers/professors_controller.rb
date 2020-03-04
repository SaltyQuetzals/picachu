# frozen_string_literal: true

class ProfessorsController < ApplicationController
  before_action :set_professor, only: %i[show update destroy]

  # GET /professors
  def index
    @professors = Professor.all

    render json: @professors
  end

  # GET /professors/1
  def show
    render json: @professor
  end

  # POST /professors
  def create
    @professor = Professor.new(professor_params)

    if @professor.save
      render json: @professor, status: :created, location: @professor
    else
      render json: @professor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /professors/1
  def update
    if @professor.update(professor_params)
      render json: @professor
    else
      render json: @professor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /professors/1
  def destroy
    @professor.destroy
  end

  # GET /professors/search
  def search
    @q = Professor.ransack(params[:q])
    @professors = @q.result
    render json: @professors
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_professor
    @professor = Professor.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def professor_params
    params.require(:professor).permit(:first_name, :last_name, :full_name, :display_name, :tamu_dir_title, :tamu_dir_dept, :tamu_dir_email)
  end
end
