class ApplicationController < ActionController::Base

  helper_method :current_user
  def current_user
    if session[:user_id]
      @curret_user ||= User.find(session[:user_id])
    else
      @ucurrent_user = nil
    end
  end

end
