class WorkoutCreator
  using ActiveModelErrorsMerge

  attr_reader :client, :params

  delegate :save, to: :workout

  def initialize(client:, params:)
    @client, @params = client, params
  end

  def save
    if workout.save && workout_items.each(&:save)
      return true
    else
      errors.merge_messages!(workout.errors, *workout_items.map(&:errors))
      return false
    end
  end

  def errors
    @errors ||= ActiveModel::Errors.new(self)
  end

  def valid?
    workout.valid? && errors.empty?
  end

  def workout
    @workout ||= client.workouts.build(title: params[:title])
  end

  private

  def workout_params
    params.pluck(:title)
  end

  def workout_items
    @workout_items||= workout_item_params.map do |params|
      workout.workout_items.build(params)
    end
  end

  def workout_item_params
    params[:workout_items] || Array.new
  end
end
