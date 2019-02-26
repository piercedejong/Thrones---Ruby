class HousesController < ApplicationController
  def index
  end

  def show
    binding.pry
    @house = House.find_by(name: params[:name])
  end

end
