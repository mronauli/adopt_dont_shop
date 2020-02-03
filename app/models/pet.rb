class Shelter < ApplicationRecord
  validates_presence_of :picture, :name, :description, :age, :sex, :adoption_status

  belongs_to :shelter
end
