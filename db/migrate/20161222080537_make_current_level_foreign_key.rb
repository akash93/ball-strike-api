class MakeCurrentLevelForeignKey < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :users, :gamelevels, column: :current_level_id
  end
end
