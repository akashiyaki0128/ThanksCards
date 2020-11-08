class CardsController < ApplicationController
  def index
    @users =User.all       #order("created_at desc") 降順に切り替え用
    @room =Room.new
  end

  def create
  end
  
  def new
  end
end
