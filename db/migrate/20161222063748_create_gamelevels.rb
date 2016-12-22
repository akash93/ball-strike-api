class CreateGamelevels < ActiveRecord::Migration[5.0]
  def change
    create_table :gamelevels do |t|
      t.integer :num_enemies, default:0
      t.integer :num_balls, default:0
      t.integer :num_hits_per_enemy, default:0

      t.timestamps
    end
  end
end
