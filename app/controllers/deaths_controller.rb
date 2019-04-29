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
      case c.status
      when "alive"
        case @status
        when "alive"
          c.update(points: 1)
        when "dead"
          c.update(points: 0)
        when "wight"
          c.update(points: 0)
        when "none"
          c.update(points: 0)
        end
      when "dead"
        case @status
        when "alive"
          c.update(points: 0)
        when "dead"
          c.update(points: 1)
        when "wight"
          c.update(points: 1)
        when "none"
          c.update(points: 0)
        end
      when "wight"
        case @status
        when "alive"
          c.update(points: -1)
        when "dead"
          c.update(points: 0)
        when "wight"
          c.update(points: 2)
        when "none"
          c.update(points: 0)
        end
      when "none"
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
        if a.text.eql? q.answer and !q.answer.eql?""
          a.update_column(:correct, true)
        elsif q.answer.eql?""
          a.update_column(:correct, nil)
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
        if a.answer.eql? q.answer and !a.answer.eql?""
          a.update_column(:correct, true)
        elsif q.answer.eql?""
          a.update_column(:correct, nil)
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
