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
      redirect_to :back
    end

    # if @comment.save
    #   redirect_to users_path
    # else
    #   render :index
    # end
  end

  def show 
    @user = current_user
    @posts = @user.posts
    @comments = Comment.new

  end


  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :id, :password_confirmation, :avatar, :comments => (:body))
  end
end
