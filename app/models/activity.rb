class Activity < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :depertment
  belongs_to_active_hash :philosophy

  belongs_to :user,optional: true 
  #外部キーがnilであることを許可する、ウィザード形式なので入力時は外部キーが無いため

  validates  :depertment_id, numericality: { other_than: 1 ,message: 'must be selected'} 
  validates  :philosophy_id, numericality: { other_than: 1 ,message: 'must be selected'}
  validates :hobby,presence: true

  # def self.guest_activity
  #   user =  User.find_by(email:'guest@example.com')
  #   @activity = find_or_create_by!(depertment_id: 2,philosophy_id:3,hobby:"ごはん",good_thing:"ゲスト")
  #   user.build_activity(@activity.attributes)
  #   user.save
  # end
end
