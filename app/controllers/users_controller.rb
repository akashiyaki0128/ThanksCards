class UsersController < ApplicationController
  before_action :ensure_current_user, only: :edit
  before_action :guest_user_auth,only: :edit
  
  def show
    @user = User.find(params[:id])
    @card = Card.new
    @receive_cards = @user.receive_cards.includes(:user,:card).order("created_at desc")
    @send_cards = @user.send_cards.includes(:user,:card).order("created_at desc")
    @guest_user = User.find_by(email:'guest@example.com')
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

  def search
    @users = User.search(params[:keyword])
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

  def guest_user_auth
    @guest_user = User.find_by(email:'guest@example.com')
    if current_user == @guest_user
      redirect_to root_path
    end
  end
  

end
