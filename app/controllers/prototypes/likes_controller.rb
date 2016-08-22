class Prototypes::LikesController < ApplicationController
  before_action :set_prototype, only: [:create, :destroy]

  def create
    @like = @prototype.likes.create(user_id: current_user.id)
  end

  def destroy
    Like.find(params[:id]).destroy
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end
end
