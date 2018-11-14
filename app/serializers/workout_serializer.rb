class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :title, :client_id

  has_many :workout_items
end
