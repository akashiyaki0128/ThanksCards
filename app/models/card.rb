class Card < ApplicationRecord

  validates :content, presence: true

  belongs_to :send_user, class_name: "User"
  belongs_to :receive_user,class_name: "User"
end
