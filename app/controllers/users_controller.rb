class UsersController < ApplicationController

  def index
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      rerender :new
    end
  end

  def show 
    @user = User.find(params[:id])
  end


  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :id, :password_confirmation)
  end
end
