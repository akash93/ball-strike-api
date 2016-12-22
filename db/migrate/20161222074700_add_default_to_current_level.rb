class AddDefaultToCurrentLevel < ActiveRecord::Migration[5.0]
  def change
    change_column_default :users, :current_level_id, 1
  end
end
