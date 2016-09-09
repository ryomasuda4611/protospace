class UsersController < ApplicationController

  # before_action :authenticate_user! ,only: [:show, :update, :edit]

  def show
    @user = User.find(params[:id])
    @prototypes = @user.prototypes.page(params[:page]).per(5)
  end

  def edit
  end

  def update
    if current_user.update(update_params)
      sign_in(current_user, bypass: true)
      redirect_to user_url(current_user) , flash: { success: 'Yes!! Success' }
    else
      redirect_to edit_user_path(current_user), alert: 'All forms can\'t be blank'
    end
  end

  private

  def update_params
    params.require(:user).permit(:username,:password, :avatar, :profile, :member, :works)
  end
end
