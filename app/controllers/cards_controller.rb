class CardsController < ApplicationController
  def index
    @users =User.all       #order("created_at desc") 降順に切り替え用
    @cards = Card.includes(:receive_user,:send_user).order("created_at desc")
    
  end
  
  def new
    @card = Card.new
  end
  
  def create
    @card = Card.new(card_params)
    if @card.valid?
      @card.save
      # binding.pry
      SendCard.create(user_id: @card.send_user_id,card_id: @card.id)
      ReceiveCard.create(user_id: @card.receive_user_id,card_id: @card.id)
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def card_params
    params.require(:card).permit(:content,:receive_user_id).merge(send_user_id: current_user.id)
  end
end
