class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true

         has_many :cards
         has_one :activity , dependent: :destroy
         has_many :receive_cards
         has_many :send_cards
         has_one_attached :image
end
