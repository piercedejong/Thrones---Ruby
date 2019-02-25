class HousesController < ApplicationController
  def index
  end

  def show
    @house = House.find_by(name: params[:format])
  end

end
