class Dog < ApplicationRecord
  validates :name, :presence => true
  validates :gender, :presence => true
  validates :breed, :presence => true
  validates :size, :presence => true
end