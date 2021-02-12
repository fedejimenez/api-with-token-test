# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Test API Authentication', type: :request do
  let(:post_request) { post '/api/v1/test', headers: headers }

  before do
    ENV['API_KEY'] = 'test_api_key'
  end

  context 'when the user provides a valid api token' do
    let(:headers) { { 'Authorization' => 'Bearer test_api_key, api_key=API_KEY' } }

    context 'when creating a resource' do
      let(:test) { build(:test) }
      let(:valid_attributes) { FactoryBot.attributes_for(:test) }
      let(:post_request) { post '/api/v1/test', params: { test: valid_attributes }, headers: headers }

      it 'creates a new test object' do
        post_request

        expect(JSON(response.body)['source_uuid']).to eq(test[:source_uuid])
      end

      it 'returns status code 201' do
        post_request

        expect(response.status).to eq(200)
      end
    end

    context 'when updating the resource' do
      let!(:test) { create(:test) }
      let(:post_request) { post '/api/v1/test', params: { test: { source_uuid: test.source_uuid, status: 'updated' } }, headers: headers }

      it 'updates the record' do
        post_request

        expect(JSON(response.body)['status']).to eq('updated')
      end
    end

    context 'when the source_uuid is missing' do
      let(:post_request) { post '/api/v1/test', params: { test: { status: 'updated' } }, headers: headers }

      it 'returns a validation failure message' do
        post_request

        expect(response.body).to eq({ 'error' => { source_uuid: ["can't be blank"] } }.to_json)
      end
    end
  end

  context 'when the request has an invalid key' do
    let(:headers) { { 'Authorization' => 'Bearer test_api_key, api_key=FAKE_KEY' } }

    it 'does not allow to user to access' do
      post_request

      expect(response.unauthorized?).to be(true)
    end
  end

  context 'when the request has an invalid token' do
    let(:headers) { { 'Authorization' => 'Bearer fake_api_key, api_key=API_KEY' } }

    it 'does not allow to user to access' do
      post_request

      expect(response.unauthorized?).to be(true)
    end
  end
end
