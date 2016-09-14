class Prototypes::PopularController < ApplicationController

  def index
    @prototypes = Prototype.includes(:user).order("prototypes.likes_counter DESC").page(params[:page]).per(5)
    render 'prototypes/index'
  end
end
