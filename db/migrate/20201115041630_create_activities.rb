class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|

      t.integer :depertment_id
      t.integer :philosophy_id
      t.string :hobby
      t.text :good_thing
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
