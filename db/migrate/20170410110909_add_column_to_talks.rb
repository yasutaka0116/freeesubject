class AddColumnToTalks < ActiveRecord::Migration
  def change
    add_column :talks, :sender_id, :integer
  end
end
