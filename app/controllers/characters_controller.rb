class CharactersController < ApplicationController

  def index
  end


  def stat
    @dead=0
    @alive=0
    @wight=0
    Death.all.each do |d|
      @dead=0
      @alive=0
      @wight=0
      @character = Character.where(name: d.name)
      @character.all.each do |c|
        if c.walker
          @wight+=1.0
        elsif c.dead
          @dead+=1.0
        else
          @alive+=1.0
        end
      end
      @alive = @alive / User.count
      @dead = @dead / User.count
      @wight = @wight / User.count
      puts @alive
      puts @wight
      puts @alive
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
    return @alive.to_i.to_s+"%"
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
    return @dead.to_i.to_s+"%"
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
    return @wight.to_i.to_s+"%"
  end
end
