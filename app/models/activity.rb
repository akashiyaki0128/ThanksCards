class Activity < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :depertment
  belongs_to_active_hash :philosophy

  belongs_to :user,optional: true

  validates  :depertment_id, numericality: { other_than: 1 } 
  validates  :philosophy_id, numericality: { other_than: 1 }
  validates :hobby,presence: true
end
