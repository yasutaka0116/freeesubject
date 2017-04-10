class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :friendship_id
      t.timestamps null: false
    end
    add_foreign_key :rooms, :friendships, column: :friendship_id
  end
end
