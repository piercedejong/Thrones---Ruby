class HousesController < ApplicationController
  def index
    if current_user
      House.all.each do |x|
        x.update_points
      end
    else
      redirect_to root_path
    end
  end

  def show
    if current_user
      @house = House.find_by(name: params[:name])
      @house.update_house_answers(current_episode)
    else
      redirect_to root_path
    end
  end
end
