class GamelevelSerializer < ActiveModel::Serializer
  attributes :id, :num_enemies, :num_balls, :num_hits_per_enemy
end
