class ApplicationController < ActionController::Base

  helper_method :current_user
  helper_method :alive
  helper_method :dead
  helper_method :wight

  def current_user
    return unless cookies.signed[:permanent_user_id] || session[:user_id]
    begin
      @current_user ||= User.find_by(uuid: cookies.signed[:permanent_user_id] || session[:user_id])
    rescue Mongoid::Errors::DocumentNotFound
      nil
    end
  end

end
