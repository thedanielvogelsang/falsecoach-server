class WorkoutItemSerializer < ActiveModel::Serializer
  attributes :id, :title

  belongs_to :workout
end
