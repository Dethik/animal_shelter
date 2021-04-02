FactoryBot.define do
  factory(:dog) do
    name {Faker::Creature::Dog.name}
    gender {Faker::Creature::Dog.gender}
    breed {Faker::Creature::Dog.breed}
    size {Faker::Creature::Dog.size}
  end
  factory(:cat) do
    name {Faker::Creature::Cat.name}
    gender {Faker::Creature::Dog.gender}
    breed {Faker::Creature::Cat.breed}
    size {Faker::Creature::Dog.size}
  end
end