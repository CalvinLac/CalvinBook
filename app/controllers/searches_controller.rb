class SearchesController < ApplicationController
  def index
    @search = params[:search]
    regex = /a*#{@search}/
    @users=User.all
    @matched_users=[]
    @users.each do |user|
      @matched_users<< user if user.username.match(regex)
    end
  end
end
