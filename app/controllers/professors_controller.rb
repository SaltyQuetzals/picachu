class ProfessorsController < ApplicationController
  before_action :set_professor, only: %i[show edit update destroy]

  # GET /professors
  # GET /professors.json
  def index
    @professors = Professor.all
  end

  # GET /professors/1
  # GET /professors/1.json
  def show; 
    @avg_review = if @professor.reviews.blank? 
                    0
                  else
                    @professor.reviews.average(:overall_rating)
                  end
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
    render json: @professors
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