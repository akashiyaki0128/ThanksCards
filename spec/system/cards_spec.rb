require 'rails_helper'

# 確認コマンド↓
# bundle exec rspec spec/system/cards_spec.rb 
RSpec.describe "Cards", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @another_user = FactoryBot.create(:user)
  end

  context 'カードを贈る' do
    it 'メインページから贈る' do
      # サインインする
      sign_in(@user)

      # カードを贈るページへ遷移
      click_on("ありがとうカードを贈ろう")

      # ユーザーを選択しコメントを書いてカードを贈る
      select @another_user.nickname, from: "card_receive_user_id"
      content = "ありがとう！"
      fill_in 'メッセージ', with: content
      expect{ click_on("カードを贈る")}.to change { Card.count}.by(1)
      #メインページに遷移
      expect(current_path).to eq root_path
      #メインページに送ったカードが表示される
      expect(page).to have_content(content)

    end
    it 'ユーザー詳細ページから贈る' do
      # サインインする
      sign_in(@user)

      # ユーザー詳細ページへ遷移
      # click_on(@user.nickname)
      # コメントを書いてカードを贈る

      #メインページに遷移

      #ユーザー詳細ページに遷移

      #ユーザー詳細ページに送ったカードが表示されるくることを確認する

    end
  end







end
