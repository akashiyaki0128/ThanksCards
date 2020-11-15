class CreateSendCards < ActiveRecord::Migration[6.0]
  def change
    create_table :send_cards do |t|

      t.references :user, foreign_key: true
      t.references :card, foreign_key: true
      t.timestamps
    end
  end
end
