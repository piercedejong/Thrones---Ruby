class CharactersController < ApplicationController

  helper_method :alive
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
    characters = Character.where(name: params[:id])
    @alive = 0.0
    characters.all.each do |c|
      if c.alive
        @alive+=1
      end
    end
    @alive = @alive / User.count
    binding.pry
    return @alive
  end

  def dead
    characters = Character.where(name: params[:id])
    @dead = 0.0
    characters.all.each do |c|
      if c.dead and !c.walker
        @dead+=1
      end
    end
    @dead = @dead / User.count
    return @dead
  end

  def wight
    characters = Character.where(name: params[:id])
    @wight = 0.0
    characters.all.each do |c|
      if c.walker
        @wight+=1
      end
    end
    @wight = @wight / User.count
    return @wight
  end
end
