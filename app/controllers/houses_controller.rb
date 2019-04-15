class HousesController < ApplicationController
  def index
    if current_user
    else
      redirect_to root_path
    end
  end

  def show
    if current_user
      @house = House.find_by(name: params[:name])
      update_house_answers(@house)
      @house.update_characters
      @house.update_points
    else
      redirect_to root_path
    end
  end

  def update_house_answers(house)
    @house = house
    @house.house_answers.where("episode <= ?", current_episode).each do |a|
      yes = 0
      no = 0
      none = 0
      @house.users.where(paid:true).each do |u|
        text = u.house_answers.find_by(aid: a.aid).text
        if text.eql? "Yes"
          yes+=1
        elsif text.eql? "No"
          no+=1
        else
          none+=1
        end
      end
      if @house.users.count > 0
        yes = (yes*100/@house.users.where(paid:true).count).round(2)
        no = (no*100/@house.users.where(paid:true).count).round(2)
        none = (none*100/@house.users.where(paid:true).count).round(2)
      end
      if no==0 and yes == 0
        x = "House Answer: No one in this house has voted yet"
        a.update_column(:answer, "none")
      elsif yes>=no
        x = " "
        a.update_column(:answer, "Yes")
        if none > 0
          x += yes.to_s+"% voted yes, " +no.to_s+"% voted no, and " +none.to_s+"% have not voted yet"
        else
          x += yes.to_s+"% voted yes and " +no.to_s+"% voted no"
        end
      else
        x = ""
        a.update_column(:answer, "No")
        if none > 0
          x += yes.to_s+"% voted yes, " +no.to_s+"% voted no, and " +none.to_s+"% have not voted yet"
        else
          x += yes.to_s+"% voted yes and " +no.to_s+"% voted no"
        end
      end
      a.update(text: x)
    end
  end
end
