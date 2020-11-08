class RoomsController < ApplicationController


  def create
    @room = Room.new
    binding.pry
  end
end
