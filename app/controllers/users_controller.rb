class UsersController < ApplicationController

  def index
    @user = User.new
  end

  def create
    @comment = Comment.new
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      rerender :new
    end

    if @comment.save
      redirect_to users_path
    else
      rerender :new
    end
  end

  def show 
    @user = current_user
    @posts = @user.posts
    @comments = Comment.new

  end


  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :id, :password_confirmation, :comments => (:body))
  end
end
