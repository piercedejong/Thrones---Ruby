class HousesController < ApplicationController
  def index
  end

  def show
    @house = House.find_by(name: params[:name])

    characters = []
    @house.users.all.each do |u|
      characters+= u.characters
    end
    @house.characters.all.each do |c|
      alive = 0
      dead = 0
      wight = 0
      none = 0
      characters.each do |r|
        if(r.name.eql? c.name)
          if r.status.eql? "alive"
            alive+=1
          elsif r.status.eql? "dead"
            dead+=1
          elsif r.status.eql? "wight"
            wight+=1
          else
            none+=1
          end
          characters.delete(r)
        end
      end
      if alive >= dead and alive >= wight and alive >= none and alive > 0
        c.update_column(:status,"alive")
      elsif dead >= wight and dead >= none and dead > 0
        c.update_column(:status,"dead")
      elsif wight >= none and wight > 0
        c.update_column(:status,"wight")
      else
        c.update_column(:status,"none")
      end
    end
  end
end
