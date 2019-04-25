class Stroll < ApplicationRecord
  has_many :join_stroll_dogs 
  has_many :dogs, through: :join_stroll_dogs
  belongs_to :dogsitter
end
