class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @room = Room.new
    @entries = Entry.all
  end


  def edit
  end
end
