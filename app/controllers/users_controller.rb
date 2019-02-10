class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if(current_user and current_user.role.eql? "admin")
      @user = User.find_by(uuid: params[:id])
    else
      redirect_to users_path
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find_by(uuid: params[:id])
  end

  def dead
    @word = ""
    @walker = ""
    @character = current_user.characters.find_by(name: params[:character])
    @character.update(dead: !@character.dead)
    if @character.dead
      @word = "Dead"
      @walker = "Just Dead"
      @character.update(walker:false)
    else
      @word = "Alive"
      @walker = "N/A"
      @character.update(walker: false)
    end
    if request.xhr?
      render :json => {
        word: @word,
        walker: @walker
      }
    end
  end

  def walker
    @word = ""
    @character = current_user.characters.find_by(name: params[:character])
    if @character.dead
      @character.update(walker: !@character.walker)
      if @character.walker
        @word = "Wight"
      else
        @word = "Just Dead"
      end
      if request.xhr?
        render :json => {
          word: @word
        }
      end
    end
  end

  def paid
    @word=""
    @user = User.find_by(email: params[:email])
    if @user.payed
      @user.update(payed: false)
      @word="false"
    else
      @user.update(payed: true)
      @word = "true"
    end
    if request.xhr?
      render :json => {
        word: @word
      }
    end
  end

  # POST /users
  # POST /users.json
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

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
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
