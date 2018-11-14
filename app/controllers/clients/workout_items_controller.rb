module Clients
  class WorkoutItemsController < ApplicationController
    before_action :require_client

    attr_reader :authorized_client

    def update
      if new_results.present?
        workout_item.update!(results: new_results)

        render json: workout_item
      else
        render json: {errors: ["Results can not be blank!"]}, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: {errors: [e.message]}, status: :not_found
    end

    private

    def new_results
      workout_item_params[:results]
    end

    def workout_item_params
      params.require(:workout_item).permit(:results)
    end

    def workout_item
      @workout_item ||= authorized_client.workout_items.find(params[:id])
    end

    def require_client
      if authorized_client
        true
      else
        render json: {errors: ["Unauthorized"] }, status: :unauthorized
      end
    end

    def authorized_client
      @authorized_client ||= Client.find_by(id: request.headers['CLIENT_ID'])
    end
  end
end
