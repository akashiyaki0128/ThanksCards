class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @card = Card.new
    @receive_cards = @user.receive_cards.includes(:user,:card).order("created_at desc")
    @send_cards = @user.send_cards.includes(:user,:card).order("created_at desc")
  end


  def edit
    @user = User.find(params[:id])
    @activity = Activity.find(params[:id])
    # binding.pry
  end
  
  def update
    @user = User.find(params[:id])
    @activity = Activity.find(params[:id])
    
    @user.update(user_params)
    @activity.update(activity_params)
    redirect_to root_path
    # binding.pry
  
  end

  def user_params
    params.require(:user).permit(:nickname,:image)
  end
  
  def activity_params
    params.require(:activity).permit(:depertment_id,:philosophy_id,:hobby,:good_thing)
  end

end
