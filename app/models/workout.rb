class Workout < ApplicationRecord
  belongs_to :client
  validates :title, presence: true

  has_many :workout_items
end
