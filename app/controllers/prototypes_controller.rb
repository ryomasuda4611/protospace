class PrototypesController < ApplicationController
   def index
    @prototypes = Prototype.all
  end

  def show
    @prototype= Prototype.where(:user_id => params[:user_id])
  end

  def new
    @prototype = Prototype.new
    @prototype.prototype_images.build
  end

  def create
    @prototype = Prototype.new(title: prototype_params[:title], catch_copy: prototype_params[:catch_copy], concept: prototype_params[:concept], user_id: current_user.id)
    if @prototype.save
      redirect_to root_path, notice: "Prototype was successfully created"
    else
      redirect_to new_user_prototype(current_user), alert: "Posting was rejected"
    end
  end

  private
    def prototype_params
      params.require(:prototype).permit(
        :title,
        :catch_copy,
        :concept,
        prototype_images_attributes:[:id, :image_url,:role]
        )
    end
end
