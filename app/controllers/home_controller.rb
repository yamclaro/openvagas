class HomeController < ApplicationController
  def index
    @pagy, @positions = pagy(Position.all)
  end
  
end
