require 'rails_helper'

describe 'POST /workouts' do
  let!(:client) { create(:client) }
  let(:client_id) { client.id }

  let(:workout_params) { { title: 'Heyoo!' } }

  before { post client_workouts_path(client_id: client_id), params: { workout: workout_params } }

  let(:created_workout) { Workout.find_by(id: response_json[:id]) }

  it 'creates a workout' do
    expect(created_workout).to be_present
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

  context 'with some workout items provided' do
    let(:workout_params) { super().merge(workout_items: workout_items_params) }
    let(:workout_items_params) { [{title: 'Bench Press'}] }

    context 'when the workout is invalid' do
      let(:workout_params) { super().tap {|p| p.delete(:title) } }

      it 'responds with unprocessable' do
        expect(response).to be_unprocessable
      end

      it 'does not create the workout items' do
        expect(WorkoutItem).not_to be_any
      end
    end

    it 'creates a workout item on the workout' do
      expect(created_workout.workout_items.first).to be_present
    end

    it 'includes created workout items in the response' do
      expect(response_json[:workout_items].try(:first)).to be_present
    end
  end
end
