class SendCard < ApplicationRecord
  belongs_to :user
  belongs_to :card
end
