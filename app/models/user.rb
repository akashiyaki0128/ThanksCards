class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true

         has_many :entries, dependent: :destroy
         has_many :rooms,through: :entries
         has_many :cards, dependent: :destroy
end
