class WorkoutsController < ApplicationController
  def create
    workout = client.workouts.build(workout_params)

    if workout.save
      render json: workout
    else
      render json: { errors: workout.errors.full_messages }
    end
  rescue ActiveRecord::RecordNotFound
    render json: { errors: ["Can't find client with ID `#{params[:client_id]}`"] }, status: :not_found
  end

  private

  def client
    @client ||= Client.find(params[:client_id])
  end

  def workout_params
    params.require(:workout).permit(:title)
  end
end
