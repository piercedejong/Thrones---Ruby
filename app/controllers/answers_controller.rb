class AnswersController < ApplicationController
  def index
  end

  def create
    @answers = params[:answers]
    current_user.answers.first.update(text:@answers[0][:text])
    current_user.answers.second.update(text:@answers[1][:text])
    current_user.answers.third.update(text:@answers[2][:text])
    current_user.answers.fourth.update(text:@answers[3][:text])
    current_user.answers.fifth.update(text:@answers[4][:text])
    redirect_to root_path
  end

  def show
  end
end
