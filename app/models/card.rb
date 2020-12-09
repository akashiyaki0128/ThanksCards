class Card < ApplicationRecord

  validates :content, presence: true

  belongs_to :send_user, class_name: "User"
  belongs_to :receive_user,class_name: "User"
  
  has_many :likes
  has_many :users, through: :likes

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
