class CardsController < ApplicationController
  def index
    @users =User.all       #order("created_at desc") 降順に切り替え用
  end

  
  def new
  end
end
