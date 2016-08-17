class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_prototype, only: [:show, :destroy, :edit, :update]

  def index
    @prototypes = Prototype.includes(:user)
  end

  def show
  end

  def destroy
    if @prototype.user_id == current_user.id
      if @prototype.destroy
        redirect_to action: :index , notice: "Prototype was successfully destroyed"
      else
        redirect_to action: :edit, alert: "Destroying was rejected"
      end
    end
  end

  def edit
  end

  def update
    if @prototype.user_id == current_user.id
      if @prototype.update(prototype_params)
        redirect_to action: :index, notice: "Prototype was successfully updated"
      else
        redirect_to action: :edit, alert: "Updating was rejected"
      end
    end
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

    def set_prototype
      @prototype = Prototype.find(params[:id])
    end

    def prototype_params
      params.require(:prototype).permit(
        :title,
        :catch_copy,
        :concept,
        :user_id,
        prototype_images_attributes:[:id, :image, :status]
        )
    end
end
