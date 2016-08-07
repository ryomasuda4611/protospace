class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]

  # GET /prototypes
  # GET /prototypes.json
  def index
    @prototypes = Prototype.all
  end

  # GET /prototypes/1
  # GET /prototypes/1.json
  def show
    @prototype= Prototype.where(:user_id => params[:user_id])
  end

  # GET /prototypes/new
  def new
    @prototype = Prototype.new
    @prototype.prototype_images.build
  end

  # GET /prototypes/1/edit
  def edit
  end

  # POST /prototypes
  # POST /prototypes.json
  def create
    @prototype = Prototype.new(title: prototype_params[:title], catch_copy: prototype_params[:catch_copy], concept: prototype_params[:concept], user_id: current_user.id)

    respond_to do |format|
      if @prototype.save
        format.html { redirect_to root_path, notice: 'Prototype was successfully created.' }
        format.json { render :show, status: :created, location: @prototype }
      else
        format.html { render :new }
        format.json { render json: @prototype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prototypes/1
  # PATCH/PUT /prototypes/1.json

  def destroy
    @prototype.destroy
    respond_to do |format|
      format.html { redirect_to prototypes_url, notice: 'Prototype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prototype
      @prototype = Prototype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prototype_params
     params.require(:prototype).permit(
        :title,
        :catch_copy,
        :concept,
        prototype_images_attributes:[:id, :image_url, :role]
      )
   end
end
