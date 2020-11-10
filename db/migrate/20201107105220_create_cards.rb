class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|

      t.references :send_user,    foreign_key: {to_table: :users}
      t.references :receive_user, foreign_key: {to_table: :users}
      t.references :room, foreign_key: true
      t.text :content, null: false
      t.timestamps
    end
  end
end
