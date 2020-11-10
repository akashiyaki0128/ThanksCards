class Room < ApplicationRecord

  validates :name, presence: true

  has_many :entries, dependent: :destroy
  has_many :users,through: :entries
  has_many :cards, dependent: :destroy
end
