class Activity < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :depertment
  belongs_to_active_hash :philosophy

  belongs_to :user,optional: true 
  #外部キーがnilであることを許可する、ウィザード形式なので入力時は外部キーが無いため

  validates  :depertment_id, numericality: { other_than: 1 ,message: 'を選択してください'} 
  validates  :philosophy_id, numericality: { other_than: 1 ,message: 'を選択してください'}
  validates :hobby,presence: true
end
