class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_prototype, only: [:show, :destroy, :edit, :update]
  def index
    @prototypes = Prototype.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

  def show
    @like = Like.find_by(prototype_id: @prototype.id)
    @comment = Comment.new(prototype_id: @prototype.id)
    @comments = @prototype.comments
  end

  def destroy
    if @prototype.destroy
      redirect_to root_path , notice: "Prototype was successfully destroyed"
    else
      redirect_to action: :edit, alert: "Destroying was rejected"
    end
  end

  def edit
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to root_path, notice: "Prototype was successfully updated"
    else
      redirect_to edit_prototype_path(@prototype), alert: "Updating was rejected"
    end
  end

  def new
    @prototype = Prototype.new
    @main_image = @prototype.prototype_images.build
    @sub_images = []
    3.times{ @sub_images << (@prototype.prototype_images.build) }
    # 前までの書き方（@sub_images = 3.times {@prototype.prototype_images.build}）では@sub_imagesに代入されているのは　integer型の３だったためテストがうまくいかなかった。。rspecのおかげでミスに気づけた。ありがとうrspec
  end

  def create
    @prototype = current_user.prototypes.new(prototype_params)
    if @prototype.save
      redirect_to root_path, notice: "Prototype was successfully created"
    else
      redirect_to new_prototype_path, alert: "Posting was rejected"
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
        ).merge(tag_list: params[:prototype][:tag])
    end
end
