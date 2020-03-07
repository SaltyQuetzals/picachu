class ProfessorsController < ApplicationController
    before_action :find_professor, only: [:show, :edit, :update, :destroy]
  
    # GET /professors
    # GET /professors.json
    def index
      @professors = Professor.all
    end
  
    # GET /professors/1
    # GET /professors/1.json
    def show
      # @reviews = Review.where(professor_id: @professor.id).order("created_at DESC")
      
      if(@professor.reviews.blank?)
        @avg_review = 0
      else
        @avg_review = @professor.reviews.average(:overall_rating)
      end
    end
  
    # GET /professors/new
    def new
      @professor = Professor.new
    end
  
    # GET /professors/1/edit
    def edit
    end
  
    # POST /professors
    # POST /professors.json
    def create
      @professor = Professor.new(professor_params)
  
      if(@professor.save)
        redirect_to @professor
      else
        render 'new'
      end
      # respond_to do |format|
      #   if @professor.save
      #     format.html { redirect_to @professor, notice: 'Professor was successfully created.' }
      #     format.json { render :show, status: :created, location: @professor }
      #   else
      #     format.html { render :new }
      #     format.json { render json: @professor.errors, status: :unprocessable_entity }
      #   end
      # end
    end
  
    # PATCH/PUT /professors/1
    # PATCH/PUT /professors/1.json
    def update
      respond_to do |format|
        if @professor.update(professor_params)
          format.html { redirect_to @professor, notice: 'Professor was successfully updated.' }
          format.json { render :show, status: :ok, location: @professor }
        else
          format.html { render :edit }
          format.json { render json: @professor.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /professors/1
    # DELETE /professors/1.json
    def destroy
      @professor.destroy
      respond_to do |format|
        format.html { redirect_to professors_url, notice: 'Professor was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
  
      # Only allow a list of trusted parameters through.
      def professor_params
        params.require(:professor).permit(:first_name, :last_name,
        :full_name, :display_name, :cv_url, :tamu_dir_title, :tamu_dir_dept,
        :tamu_dir_email)
      end
  
      def find_professor
        @professor = Professor.find(params[:id])
      end
  end
  