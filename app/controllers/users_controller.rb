class UsersController < ApplicationController
  before_action :check_user_login, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      respond_to do |format|
        format.html { redirect_to photos_path }
        format.js
      end

      UserMailer.welcome_email(@user).deliver
    else
      respond_to do |format|
        format.html { render action: :new }
        format.js
      end
    end

  end

  # def show
  #   @user = User.find(params[:id])
  #   @user_tweets = @user.tweets
  # end

  # def edit
  # end

  # def update
  #   @current_user.update_attributes(user_params)
  #   redirect_to user_path(@current_user)
  # end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end
