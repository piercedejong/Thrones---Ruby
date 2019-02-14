class CharactersController < ApplicationController

  def index
    Death.all.each do |d|
      @alive = 0.0
      @dead = 0.0
      @wight = 0.0
      characters = Character.where(name: d.name)
      characters.all.each do |c|
        if !c.dead
          @alive +=1
        elsif c.walker
          @wight+=1
        else
          @dead +=1
        end
      end
      d.update(alive: (@alive*100/User.count).round(2))
      d.update(dead: (@dead*100/User.count).round(2))
      d.update(wight: (@wight*100/User.count).round(2))
    end
  end


  def stat
    Death.all.each do |d|
      @alive = 0.0
      @dead = 0.0
      @wight = 0.0
      characters = Character.where(name: d.name)
      characters.all.each do |c|
        if !c.dead
          @alive +=1
        elsif c.walker
          @wight+=1
        else
          @dead +=1
        end
      end
      d.update(alive: @alive*100/User.count)
      d.update(dead: @dead*100/User.count)
      d.update(wight: @wight*100/User.count)
    end
  end


  def alive(name)
    characters = Character.where(name: name)
    @alive = 0.0
    characters.all.each do |c|
      if !c.dead
        @alive+=1
      end
    end
    @alive = @alive / User.count * 100
    return @alive.to_i
  end

  def dead(name)
    characters = Character.where(name: name)
    @dead = 0.0
    characters.all.each do |c|
      if c.dead and !c.walker
        @dead+=1
      end
    end
    @dead = @dead / User.count * 100
    return @dead.to_i
  end

  def wight(name)
    characters = Character.where(name: name)
    @wight = 0.0
    characters.all.each do |c|
      if c.walker
        @wight+=1
      end
    end
    @wight = @wight / User.count * 100
    return @wight.to_i
  end
end
