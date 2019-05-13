class ApplicationController < ActionController::Base

  helper_method :current_user
  helper_method :alive
  helper_method :dead
  helper_method :wight
  helper_method :first_place
  helper_method :second_place
  helper_method :third_place
  helper_method :selected_answer
  helper_method :current_episode
  helper_method :video

  def current_user
    return unless cookies.signed[:permanent_user_id] || session[:user_id]
    begin
      @current_user ||= User.find_by(uuid: cookies.signed[:permanent_user_id] || session[:user_id])
    rescue Mongoid::Errors::DocumentNotFound
      nil
    end
  end

  def current_episode
    @episode =  6
  end

  def video
    videos = [
      "https://www.youtube.com/embed/rlR4PJn8b8I",
      "https://www.youtube.com/embed/wA38GCX4Tb0",
      "https://www.youtube.com/embed/NspqGM0DbbQ",
      "https://www.youtube.com/embed/vwmAWOE5F9o",
      "https://www.youtube.com/embed/p2E30wWcBjY",
      "https://www.youtube.com/embed/kuLUyJdRvSU",
    ]
    x = rand(0..5)
    return "https://www.youtube.com/embed/qyBPzUe3hNI"
  end

  def first_place
    @first_place
    points = -1
    User.all.each do |u|
      if u.points > points
        @first_place = u
        points = @first_place.points
      end
    end
    return @first_place
  end

  def second_place
    @first = first_place
    @second_place
    points = -1
    User.all.each do |u|
      if u.points > points and u.points <= @first.points and u != @first
        @second_place = u
        points = @second_place.points
      end
    end
    return @second_place
  end

  def third_place
    if second_place
      @second = second_place
      @third_place
      points = -1
      User.all.each do |u|
        if u.points > points and u.points <= @second.points and u != @second and u != first_place
          @third_place = u
          points = @third_place.points
        end
      end
      return @third_place
    end
  end

  def reset
    User.all.each do |u|
      u.characters.all.each do |c|
        c.destroy
      end
      Character.create_characters(u)
    end
  end

  def selected_answer(user, qid)

  end

end
