class Gamelevel < ApplicationRecord
  validates :num_enemies, :num_balls, :num_hits_per_enemy, presence: true
  validates :num_enemies, numericality: { greater_than_or_equal_to: 1 }
  validates :num_balls, numericality: { greater_than_or_equal_to: 1 }
  validates :num_hits_per_enemy, numericality: { greater_than_or_equal_to: 1 }

end
