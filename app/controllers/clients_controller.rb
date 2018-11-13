class ClientsController < ApplicationController
  def create
    client = Client.new(client_params)

    if client.save
      render json: client
    else
      render json: {errors: client.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private

  def client_params
    params.require(:client).permit(:first_name, :last_name, :email)
  end
end
