# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Test API Authentication', type: :request do
  before do
    ENV['API_KEY'] = 'test_api_key'
    post '/api/v1/test', headers: headers
  end

  context 'when the user provides a valid api token' do
    let(:headers) { { 'Authorization' => 'Bearer test_api_key, api_key=API_KEY' } }

    it 'allows the user to pass' do
      expect(response.successful?).to be(true)
    end

    it 'returns the correct message' do
      expect(response.body).to eq({ 'message' => 'create endpoint' }.to_json)
    end
  end

  context 'when the user provides an invalid key' do
    let(:headers) { { 'Authorization' => 'Bearer test_api_key, api_key=FAKE_KEY' } }

    it 'does not allow to user to access' do
      expect(response.unauthorized?).to be(true)
    end
  end

  context 'when the user provides an invalid token' do
    let(:headers) { { 'Authorization' => 'Bearer fake_api_key, api_key=API_KEY' } }

    it 'does not allow to user to access' do
      expect(response.unauthorized?).to be(true)
    end
  end
end
