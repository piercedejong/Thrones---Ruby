class DeathsController < ApplicationController
  def index
    if current_user and !current_user.role.eql? "admin"
      redirect_to root_path
    end
  end

  def status
    @did = params[:did]
    @character = Death.find_by(did: @did)
    @character.update(status: params["status"])
    @status = @character.status
    Character.where(cid: @character.did).each do |c|
      if c.status.eql? @status and @status.eql? "alive"
        c.update(points: 1)
      elsif c.status.eql? @status and @status.eql? "dead"
        c.update(points: 1)
      elsif c.status.eql? @status and @status.eql? "wight"
        c.update(points: 2)
      elsif c.status.eql? "dead" and @status.eql? "wight"
        c.update(points: 1)
      elsif c.status.eql? "wight" and @status.eql? "dead"
        c.update(points: 0)
      elsif c.status.eql? "wight" and @status.eql? "alive"
        c.update(points: -1)
      elsif @status.eql? "none"
        c.update(points: 0)
      else
        c.update(points: 0)
      end
    end
    if request.xhr?
      render :json => {
        status: @status,
      }
    end
    # if @character.status.eql? "alive"
    #   @character.update(status: "dead")
    #   Character.where(name: @character.name).all.each do |c|
    #     if c.status.eql?"dead"
    #       c.update(points: 1)
    #     else
    #       c.update(points: 0)
    #     end
    #   end
    # elsif @character.status.eql? "dead"
    #   @character.update(status: "wight")
    #   Character.where(name: @character.name).all.each do |c|
    #     if c.status.eql?"walker"
    #       c.update(points: 2)
    #     else
    #       c.update(points: 0)
    #     end
    #   end
    # else
    #   @character.update(status: "alive")
    #   Character.where(name: @character.name).all.each do |c|
    #     if c.status.eql?"alive"
    #       c.update(points: 1)
    #     else
    #       c.update(points: 0)
    #     end
    #   end
    # end
    # @status = @character.status
    #
    # if request.xhr?
    #   render :json => {
    #     status: @status,
    #   }
    # end
  end

  def update_answers
    Question.all.each do |q|
      q.update_column(:answer, answer_params["a#{q.qid}"])
      Answer.where(rid: q.qid).each do |a|
        if a.text.eql? q.answer
          a.update_column(:correct, true)
        else
          a.update_column(:correct, false)
        end
      end
    end
    redirect_to deaths_path
  end

  def update_house_answers
    HouseQuestion.where(episode: current_episode).each do |q|
      q.update_column(:answer, answer_params["a#{q.id}"])
      HouseAnswer.where(aid: q.id).each do |a|
        if a.answer.eql? q.answer
          a.update_column(:correct, true)
        else
          a.update_column(:correct, false)
        end
      end
    end
    redirect_to deaths_path
  end


  private
  def answer_params
    params.require(:answer).permit(:a1, :a2, :a3, :a4, :a5, :a6)
  end

  def house_answer_params
    params.require(:answer)
  end

end
