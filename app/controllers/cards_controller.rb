class CardsController < ApplicationController
  def index
    @users =User.all       #order("created_at desc") 降順に切り替え用
    @room =Room.new
    @rooms = Room.all
    @entries = Entry.all
    @cards = Card.all
  end

  def new
    @card = Card.new
    @room = Room.find(params[:room_id])
  end
  
  def create
    # binding.pry
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
    params.require(:card).permit(:content).merge(user_id: current_user.id)
  end
end
