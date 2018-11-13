require 'rails_helper'

describe 'POST /clients' do
  before { post clients_path, params: { client: client_params } }

  context 'with valid parameters' do
    let(:client_params) { build(:client).attributes }

    it 'responds with success' do
      expect(response).to be_successful
    end

    it 'creates a new Client' do
      expect(Client.first).to be_present
    end

    it 'responds with a serialized client' do
      expect(Client.find_by(id: response_json[:id])).to be_present
    end
  end

  context 'with invalid parameters' do
    context 'email missing' do
      let(:client_params) { { first_name: 'Blarp', last_name: 'Glarplebliemer' } }

      it 'responds with unprocessable' do
        expect(response).to be_unprocessable
      end

      it 'includes a sensible error' do
        expect(response_json[:errors].first).to include('Email')
      end
    end
  end
end
