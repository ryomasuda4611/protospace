class PrototypesController < ApplicationController

  def index
    @prototypes = Prototype.includes(:user)
  end

  def show
    @prototype= Prototype.find_by(id: params[:id])
  end

  def new
    @prototype = Prototype.new
    @prototype.prototype_images.build
  end

  def create
    @prototype = current_user.prototypes.new(prototype_params)
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
        :user_id,
        prototype_images_attributes:[:id, :image,:status]
        )
    end
end
