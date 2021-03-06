require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "新規登録" do
    context '新規登録がうまくいくとき' do
        it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
          expect(@user).to be_valid
        end
        
        it "passwordが6文字以上であれば登録できる" do
          @user.password = "asdddd"
          @user.password_confirmation = "asdddd"
          expect(@user).to be_valid
        end
      end
      
      context '新規登録がうまくいかないとき' do
        it "nicknameが空だと登録できない" do
          @user.nickname= ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it "emailが空だと登録できない" do
          @user.email= ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it "passwordが空だと登録できない" do
          @user.password= ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it "passwordが5文字以下であれば登録できないこと" do
          @user.password = "12345"
          @user.password_confirmation = "12345"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
        
        it "passwordとpassword_confirmationが不一致では登録できないこと" do
          @user.password = "123456"
          @user.password_confirmation = "1234567"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it "emailは＠がなければ登録できない" do
          @user.email = "katakana"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end
        it "重複したemailが存在する場合登録できない" do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end
      end
  end
end
