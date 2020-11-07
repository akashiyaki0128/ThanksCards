class Room < ApplicationRecord

  validates :name, presence: true

  has_many :entries
  has_many :users,through: :entries
  has_many :cards
end
