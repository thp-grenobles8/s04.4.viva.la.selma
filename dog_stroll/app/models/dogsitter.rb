class Dogsitter < ApplicationRecord
  has_many :strolls
  has_many :join_stroll_dogs, through: :strolls
  has_many :dogs, through: :join_stroll_dogs
  belongs_to :city
end
