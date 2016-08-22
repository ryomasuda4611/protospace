class Prototypes::CommentsController < ApplicationController
before_action :set_prototype, only [:create, :destroy]
after_action :set_comments, only [:create, :destroy]
  def create
    @comment = @prototype.comments.create(create_params)
  end

  def destroy
    Comment.find(params[:id]).destory if user_id == current_user.id
  end

private

  def comment_params
    params.require(:comment).permit(:review)
  end

  def set_prototype
    @prototype = Prototype.find_by(prototype_id: params[:prototype_id])
  end

  def set_comments
    @comments = @prototype.comments.includes(:user, :prototype)
  end
end
