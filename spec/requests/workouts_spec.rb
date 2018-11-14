require 'rails_helper'

describe 'POST /workouts' do
  let!(:client) { create(:client) }
  let(:client_id) { client.id }

  let(:workout_params) { { title: 'Heyoo!' } }

  before { post client_workouts_path(client_id: client_id), params: { workout: workout_params } }

  it 'creates a workout' do
    expect(Workout.first).to be_present
  end

  it 'responds with the workout' do
    expect(response_json[:title]).to eql(workout_params[:title])
  end

  context 'with an invalid client' do
    let(:client_id) { 9999 }

    it 'responds with not found' do
      expect(response).to be_not_found
    end
  end
end
