class LikesController < ApplicationController
  before_action :set_like

  def create
    # binding.pry
    card = Card.find(params[:card_id])
    like = Like.create(user_id: current_user.id,card_id: card.id)
    redirect_to root_path
  end
  
  def destroy
    # binding.pry
    card = Card.find(params[:card_id])
    like = Like.find_by(user_id: current_user.id,card_id: card.id)
    like.delete
    redirect_to root_path
  end

  private
  def set_like
    @card = Card.find(params[:card_id])
  end
end
