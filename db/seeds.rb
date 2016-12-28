# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'user@example.com', password: 'password')

10.times do |i|
  Gamelevel.create(num_balls:1, num_enemies: 2, num_hits_per_enemy: 5*(i+1))
end

5.times do |i|
  Gamelevel.create(num_balls:2, num_enemies:3, num_hits_per_enemy: 10*(i+1))
end
