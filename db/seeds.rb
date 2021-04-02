# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
class Seed

  def self.begin
    seed = Seed.new
    seed.generate_dogs
    seed.generate_cats
  end

  def generate_dogs
    20.times do |i|
      Dog.create!(
        name: Faker::Creature::Dog.name,
        gender: Faker::Creature::Dog.gender,
        breed: Faker::Creature::Dog.breed,
        size: Faker::Creature::Dog.size
      )
    end
  end
  def generate_cats
    20.times do |i|
      Cat.create!(
        name: Faker::Creature::Cat.name,
        gender: Faker::Creature::Dog.gender,
        breed: Faker::Creature::Cat.breed,
        size: Faker::Creature::Dog.size
      )
    end
  end
end

Seed.begin