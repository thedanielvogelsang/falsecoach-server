class WorkoutsController < ApplicationController
  def create
    if creator.save
      render json: creator.workout
    else
      render json: { errors: creator.errors.full_messages }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { errors: ["Can't find client with ID `#{params[:client_id]}`"] }, status: :not_found
  end

  private

  def creator
    @creator ||= WorkoutCreator.new(client: client, params: workout_params)
  end

  def client
    @client ||= Client.find(params[:client_id])
  end

  def workout_params
    params.require(:workout).permit(:title, workout_items: [:title])
  end
end
