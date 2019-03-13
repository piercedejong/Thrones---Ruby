class CharactersController < ApplicationController

  def index
    Death.all.each do |d|
      @alive = 0.0
      @dead = 0.0
      @wight = 0.0
      characters = Character.where({name: d.name, house_id:nil})
      characters.all.each do |c|
        if c.status.eql?"alive" or c.status.eql?"none"
          @alive +=1
        elsif c.status.eql?"dead"
          @dead+=1
        else
          @wight +=1
        end
      end
      d.update(alive: (@alive*100/User.count).round(2))
      d.update(dead: (@dead*100/User.count).round(2))
      d.update(wight: (@wight*100/User.count).round(2))
    end
  end
end
