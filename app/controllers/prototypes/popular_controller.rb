class Prototypes::PopularController < ApplicationController

  def index
    @prototypes = Prototype.includes(:user).order("prototypes.likes_counter DESC")
    render template: "prototypes/index"
  end
end
