class Client < ApplicationRecord
  has_many :workouts

  validates :first_name, :last_name, :email, presence: true
end
