class Prototypes::PopularController < ApplicationController

  def index
    @prototypes = Prototype.order("prototypes.likes_counter DESC")
    render template: "prototypes/index"
  end
end
