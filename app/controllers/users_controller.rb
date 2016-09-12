class UsersController < ApplicationController

  before_action :authenticate_user! ,only: [:show, :update, :edit]

  def show
    @user = User.find(params[:id])
    @prototypes = @user.prototypes.page(params[:page]).per(5)
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(update_params)
      redirect_to root_path , flash: { success: 'Yes!! Success' }
    else
      redirect_to edit_user_path(@user), alert: 'All forms can\'t be blank'
    end
  end

  private

  def update_params
    params.require(:user).permit(:username,:password, :avatar, :profile, :member, :works)
  end
end
