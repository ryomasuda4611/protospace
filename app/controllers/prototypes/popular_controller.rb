class Prototypes::PopularController < ApplicationController
  
  def index
    @prototypes = Prototypes.order('likes_counter DESC')
  end
end
