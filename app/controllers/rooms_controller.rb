class RoomsController < ApplicationController


  def create
    @room = Room.new(room_params)
    if @room.save
      @card = Card.new
      # binding.pry
      redirect_to new_room_card_path(@room)
    else
      render :index
    end
  end


  private

  def room_params
    params.require(:room).permit(:name,user_ids: [])
  end
end
