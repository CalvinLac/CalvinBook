class FriendingsController < ApplicationController
  def index
    @users = User.all
  end
end
