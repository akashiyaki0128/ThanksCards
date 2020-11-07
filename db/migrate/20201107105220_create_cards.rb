class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|

      t.references :user, foreign_key: true
      t.references :room, foreign_key: true
      t.text :content, null: false
      t.timestamps
    end
  end
end
