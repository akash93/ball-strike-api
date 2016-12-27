# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Gamelevel.create(num_balls: 1, num_enemies: 2, num_hits_per_enemy: 5)
User.create(email: 'akash@gmail.com', password: 'password')
User.create(email: 'akashkhan25@gmail.com', password: 'password')


9.times do |i|
  Gamelevel.create(num_balls:1, num_enemies: 2, num_hits_per_enemy: 5*(i+2))
end

5.times do |i|
  Gamelevel.create(num_balls:2, num_enemies:3, num_hits_per_enemy: 20*(i+1))
end
