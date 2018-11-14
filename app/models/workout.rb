class Workout < ApplicationRecord
  belongs_to :client
  validates :title, presence: true
end
