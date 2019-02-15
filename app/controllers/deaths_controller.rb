class DeathsController < ApplicationController
  def index
    if current_user and !current_user.role.eql? "admin"
      redirect_to rootpath
    end
  end

  def status
    @did = params[:did]
    @character = Death.find_by(did: @did)
    if @character.status.eql? "alive"
      @character.update(status: "dead")
      Character.where(name: @character.name).all.each do |c|
        if c.status.eql?"dead"
          c.update(points: 1)
        else
          c.update(points: 0)
        end
      end
    elsif @character.status.eql? "dead"
      @character.update(status: "wight")
      Character.where(name: @character.name).all.each do |c|
        if c.status.eql?"walker"
          c.update(points: 2)
        else
          c.update(points: 0)
        end
      end
    else
      @character.update(status: "alive")
      Character.where(name: @character.name).all.each do |c|
        if c.status.eql?"alive"
          c.update(points: 1)
        else
          c.update(points: 0)
        end
      end
    end
    @status = @character.status

    if request.xhr?
      render :json => {
        status: @status,
      }
    end
  end

end
