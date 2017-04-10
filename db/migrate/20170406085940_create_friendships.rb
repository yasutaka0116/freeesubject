class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :from_user_id
      t.integer :to_user_id
      t.timestamps null: false
    end
    add_foreign_key :friendships, :users, column: :from_user_id
    add_foreign_key :friendships, :users, column: :to_user_id
  end
end
