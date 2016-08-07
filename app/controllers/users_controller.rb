class UsersController < ApplicationController

  before_action :authenticate_user! ,only: [:show, :update, :edit]

  def show
  @user = User.find(params[:id])
  end

  def edit
  end

  def update
    current_user.update(update_params)
    redirect_to user_url(current_user)
  end

  private

  def update_params
    params.require(:user).permit(:username, :avatar, :profile, :member, :works)
  end
end
