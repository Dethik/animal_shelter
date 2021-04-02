class Dog < ApplicationRecord
  validates :name, :presence => true
  validates :gender, :presence => true
  validates :breed, :presence => true
  validates :size, :presence => true

  scope :by_name, -> (name) { where("lower(name) like?", "%#{name}%")}
  scope :by_gender, -> (gender) { where("lower(gender) like?", "%#{gender}%")}
  scope :by_breed, -> (breed) { where("lower(breed) like?", "%#{breed}%")}
  scope :by_size, -> (size) { where("lower(size) like?", "%#{size}%")}
end