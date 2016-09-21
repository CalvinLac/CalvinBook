class FriendingsController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @friendings = Friending.new
    @friended_by = User.find(params[:id])
    @friendings.friender_id = current_user.id
    @friendings.friend_id= @friended_by.id
    @friendings.save
    redirect_to friendings_path

  end

end
