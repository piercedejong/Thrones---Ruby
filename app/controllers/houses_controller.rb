class HousesController < ApplicationController
  def index
  end

  def show
    @house = House.find_by(name: params[:name])
    update_characters(@house)
    update_house_answers(@house)
  end

  def update_house_answers(house)
    @house = house
    @house.house_answers.where("episode <= ?", current_episode).each do |a|
      yes = 0
      no = 0
      none = 0
      @house.users.each do |u|
        text = u.house_answers.find_by(aid: a.aid).text
        if text.eql? "Yes"
          yes+=1
        elsif text.eql? "No"
          no+=1
        else
          none+=1
        end
      end
      if yes>=no and yes >= none
        x = "Yes | "+(yes*100/@house.users.count).round(2).to_s+"% of house vote"
        a.update(text:x)
      elsif no>= none
        x = "No | "+(no*100/@house.users.count).round(2).to_s+"% of house vote"
        a.update(text: x)
      else
        x = "A majority, "+(none*100/@house.users.count).round(2).to_s+"%, of house has not voted"
        a.update(text: x)
      end
    end
  end


  def update_characters(house)
    @house = house
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
