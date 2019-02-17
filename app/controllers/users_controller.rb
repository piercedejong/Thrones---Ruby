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
    if current_user and (current_user.uuid.eql?params[:id] or current_user.role.eql? "admin")
      @user = User.find_by(uuid: params[:id])
    elsif (current_user)
      redirect_to leaderboards_path
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
    if current_user and (current_user.uuid.eql?params[:id] or current_user.role.eql? "admin")
      @user = User.find_by(uuid: params[:format])
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

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user and @user.authenticate(params[:user][:password_current])
        @user.password = params[:user][:password_new]
        @user.password_confirmation = params[:user][:password_confirmation]
        if @user.save
          format.html { redirect_to root_path, alert: 'Password Updated' }
        else
          format.html { redirect_to account_path(@user.uuid),alert: 'Password Confirmation does not match New Password' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to account_path(@user.uuid),alert: 'Incorrect Current Password' }
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
      params.require(:user).permit(:email, :username, :password, :password_confirmation)
    end
end
