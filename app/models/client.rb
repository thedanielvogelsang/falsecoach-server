class Client < ApplicationRecord
  has_many :workouts
  has_many :workout_items, through: :workouts

  validates :first_name, :last_name, :email, presence: true
end
