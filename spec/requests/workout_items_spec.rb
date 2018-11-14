require 'rails_helper'

describe 'PATCH /client/workout_items/:id' do
  let(:client) { create(:client) }
  let(:workout_item) { create(:workout_item, workout: create(:workout, client: client)) }
  let(:auth_headers) { { 'CLIENT_ID' => client.id.to_s } }
  let(:params) { { workout_item: workout_item_params } }
  let(:workout_item_params) { { results: "Got er' done!" } }

  before { patch clients_workout_item_path(workout_item.id), headers: auth_headers, params: params }

  it 'adds the results to the workout item' do
    expect(workout_item.reload.results).not_to be_empty
  end

  context 'when a result is not provided' do
    let(:workout_item_params) { { results: '' } }

    it 'responds with a sensible error' do
      expect(response).to be_unprocessable
      expect(response_json[:errors]).not_to be_empty
    end
  end

  context 'When the client does not have access to the workout item' do
    let(:other_client) { create(:client) }
    let(:workout_item) { create(:workout_item, workout: create(:workout, client: other_client)) }

    it 'responds with not found' do
      expect(response).to be_not_found
    end
  end

  context 'when I am not signed in' do
    let(:auth_headers) { Hash.new }

    it 'is unathorized' do
      expect(response).to be_unauthorized
    end
  end
end
