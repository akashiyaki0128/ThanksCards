class UsersController < ApplicationController
  before_action :ensure_current_user, only: :edit
  
  def show
    @user = User.find(params[:id])
    @card = Card.new
    @receive_cards = @user.receive_cards.includes(:user,:card).order("created_at desc")
    @send_cards = @user.send_cards.includes(:user,:card).order("created_at desc")
  end


  def edit
    @user = User.find(params[:id])
    @activity = Activity.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @activity = Activity.find(params[:id])
    
    @user.update(user_params)
    @activity.update(activity_params)
    # binding.pry
    redirect_to root_path
  
  end

  private

  def user_params
    params.require(:user).permit(:nickname,:image)
  end
  
  def activity_params
    params.require(:activity).permit(:depertment_id,:philosophy_id,:hobby,:good_thing)
  end

  def ensure_current_user
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to root_path
    end
  end

end
