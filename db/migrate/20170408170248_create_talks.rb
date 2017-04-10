class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.integer :room_id
      t.text    :message
      t.timestamps null: false
    end
    add_foreign_key :talks, :rooms, column: :room_id
  end
end
