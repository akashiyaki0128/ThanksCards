class RoomsController < ApplicationController


  def create
    @room = Room.new(room_params)
    # binding.pry
    if @room.save
      @card = Card.new
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
