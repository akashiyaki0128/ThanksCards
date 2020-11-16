class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @card = Card.new
    @receive_cards = @user.receive_cards.includes(:user,:card).order("created_at desc")
    @send_cards = @user.send_cards.includes(:user,:card).order("created_at desc")
  end


  def edit
  end
end
