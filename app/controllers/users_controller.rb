class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @room = Room.new
  end


  def edit
  end
end
