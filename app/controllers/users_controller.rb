class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the site!"
      redirect_to "/"
      else
      flash[:alert] = "There was a problem creating your account. Please try again."
      redirect_to :back
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to questions_path
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :username, :admin)
    end
end
