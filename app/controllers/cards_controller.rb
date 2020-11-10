class CardsController < ApplicationController
  def index
    @users =User.all       #order("created_at desc") 降順に切り替え用
    @room =Room.new
    @cards = Card.order("created_at desc")
    
  end
  
  def new
    @card = Card.new
    @room = Room.find(params[:room_id])
  end
  
  # binding.pry
  def create
    @room = Room.find(params[:room_id])
    @card = @room.cards.new(card_params)
    if @card.save
      redirect_to root_path
    else
      render :new
    end
  end
  

  private

  def card_params
    params.require(:card).permit(:content).merge(send_user_id: current_user.id,receive_user_id: @room.entries.first.user_id)
  end
end
