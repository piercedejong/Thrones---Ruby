class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    if(current_user)
      @users = User.all
    else
      redirect_to root_path
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    binding.pry
    if current_user and (current_user.uuid.eql?params[:uuid] or current_user.role.eql? "admin")
      @user = User.find_by(uuid: params[:uuid])
    elsif (current_user)
      redirect_to users_path
    else
      redirect_to root_path
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    if current_user and (current_user.uuid.eql?params[:uuid] or current_user.role.eql? "admin")
      @user = User.find_by(uuid: params[:uuid])
    else
      redirect_to root_path
    end
  end

  def character_status
    @character = current_user.characters.find_by(name: params[:character])
    @character.update(status: params[:status])
    @status = params[:status]
    if request.xhr?
      render :json => {
        status: @status
      }
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.characters.all.each do |x| x.destroy end
    @user.answers.all.each do |x| x.destroy end
    @user.destroy
    if current_user
      redirect_to users_path
    else
      redirect_to root_path
    end
  end

  def paid
    @word=""
    @user = User.find(params[:id])
    if @user.paid
      @user.update_column(:paid, false)
      @word="false"
    else
      @user.update_column(:paid, true)
      @word = "true"
    end
    @user.save
    if request.xhr?
      render :json => {
        word: @word
      }
    end
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        Character.create_characters(@user)
        Answer.create_answers(@user)
        cookies.permanent.signed[:permanent_user_id] = @user.uuid
        session[:user_id] = @user.uuid
        if @user.email.eql? "pierce.dejong45@gmail.com"
          @user.update(role:"admin")
        end
        format.html { redirect_to root_path }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def reset_entry
    @user = User.find_by(uuid:params[:format])
    if current_user and current_user.eql?@user
      @user.characters.all.each do |c|
        c.update(status: "none")
      end
      @user.answers.all.each do |a|
        a.update(text: "")
      end
    end
    redirect_to edit_user_path(@user.uuid), alert: 'Predictions Reset'
  end

  def update_answers
    @user = User.find_by(uuid:answers_update_params[:uuid])
    respond_to do |format|
      if current_user and @user.eql?current_user
        @user.answers.all.each do |a|
          a.update(text: answers_update_params["answer#{a.rid}"])
        end
        format.html { redirect_to user_path(@user.uuid),alert: 'Bonus Questions Saved' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      else
        format.html { redirect_to user_path(@user.uuid),alert: 'Error: You are not allowed to change soemone elses answers' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_house
    @user = User.find_by(uuid:house_update_params[:uuid])
    respond_to do |format|
      if current_user and @user.eql?current_user
        if @user and @user.authenticate(house_update_params[:password])
          if house_update_params.eql?nil
            format.html { redirect_to edit_user_path(@user.uuid),alert: 'Error: You must select a house' }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          else
            @user.update_column(:house_id, house_update_params[:house_id])
            format.html { redirect_to edit_user_path(@user.uuid),alert: 'House Updated' }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        else
          format.html { redirect_to edit_user_path(@user.uuid),alert: 'Error: Incorrect Password' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to edit_user_path(@user.uuid),alert: 'Error: You are not allowed to change soemone elses house' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_password
    @user = User.find_by(uuid:password_update_params[:uuid])
    respond_to do |format|
      if @user and @user.authenticate(password_update_params[:password_current]) and @user.eql? current_user
        @user.password = password_update_params[:password_new]
        @user.password_confirmation = password_update_params[:password_confirmation]
        if @user.save
          format.html { redirect_to edit_user_path(@user.uuid), alert: 'Password Updated' }
        else
          if @user.password == nil
            format.html { redirect_to edit_user_path(@user.uuid) ,alert: 'Error: New Password can not be blank' }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          elsif !@user.password.eql? @user.password_confirmation
            format.html { redirect_to edit_user_path(@user.uuid) ,alert: 'Error: Password Confirmation does not match New Password' }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          else
            format.html { redirect_to edit_user_path(@user.uuid) ,alert: 'Error: New Password is too short' }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      else
        format.html { redirect_to edit_user_path(@user.uuid) ,alert: 'Error: Incorrect Current Password' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_username
    @user = User.find_by(uuid:username_update_params[:uuid])
    respond_to do |format|
      password = username_update_params[:password] and @user.eql? current_user
      if @user and @user.authenticate(password)
        if @user.update_column(:username, username_update_params[:username])
          format.html { redirect_to edit_user_path(@user.uuid), alert: 'Username Updated' }
        else
          format.html { redirect_to edit_user_path(@user.uuid), alert: 'Error: Username alreay taken or is not long enough' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to edit_user_path(@user.uuid),alert: 'Error: Incorrect Password'}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by(uuid: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :username, :house_id, :password, :password_confirmation)
    end

    def password_update_params
      params.require(:user).permit(:uuid, :password_new, :password_current, :password_confirmation)
    end

    def answers_update_params
      params.require(:user).permit(:uuid, :answer1, :answer2, :answer3, :answer4, :answer5, :answer6)
    end

    def username_update_params
      params.require(:user).permit(:uuid, :username, :password)
    end

    def house_update_params
      params.require(:user).permit(:uuid, :house_id,:password)
    end
end
