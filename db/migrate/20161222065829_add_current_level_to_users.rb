class AddCurrentLevelToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :current_level_id, :integer
  end
  add_index :users, :current_level_id
end
