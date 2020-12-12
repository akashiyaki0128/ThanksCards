require 'rails_helper'

RSpec.describe Card, type: :model do

  before do
    @user = FactoryBot.create(:user)
    @another_user = FactoryBot.create(:user)
  end

  it "contentが存在すれば贈ることができること" do
    send_user = @user
    receive_user = @another_user
    @card = Card.create(send_user_id: send_user.id,receive_user_id: receive_user.id, content: "ありがとうございます！")
    expect(@card).to be_valid
  end
  
  it "contentが空では贈ることができないこと" do
    send_user = @user
    receive_user = @another_user
    @card = Card.create(send_user_id: send_user.id,receive_user_id: receive_user.id, content: "")
    expect(@card.errors.full_messages).to include("Content can't be blank")
  end

end
