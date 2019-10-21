#TODO: Move to request  spec
require 'rails_helper'

RSpec.describe V1::AuthTokenController, type: :request do
  # TODO: Add more test cases but test them against controller collaborator
  describe '#create' do
    it 'fails when params are not given' do
      post '/api/v1/auth_token', params: { credentials: { other: 'value' } }
      expect(response).to have_http_status(:bad_request)
      result = JSON.parse(response.body)
      expect(result['message']).to match(/missing.*email/)
    end

    it 'generates a token for the given credentials' do
      user = User.create(email: 'user@test.com', password: 'test')

      post '/api/v1/auth_token',
        params: { credentials: { email: 'user@test.com', password: 'test' } },
        headers: { 'Content-Type' => 'application/x-www-form-urlencoded' }

      expect(response).to have_http_status :success

      result = JSON.parse(response.body)

      expect(result['token']).to be_present
    end

    context 'when resending authorization header' do
      # TODO: It should reset the expiration date
      it 'returns 200 already logged in' do
        user = User.create(email: 'user@test.com', password: 'test')
        credentials = { credentials: { email: 'user@test.com', password: 'test' } }

        post '/api/v1/auth_token', params: credentials,
        headers: { 'Content-Type' => 'application/x-www-form-urlencoded' }

        result = JSON.parse(response.body)

        post '/api/v1/auth_token', params: credentials,
        headers: { 'Content-Type' => 'application/x-www-form-urlencoded', 'Authorization' => result['token'] }

        expect(response).to have_http_status(:success)
        result = JSON.parse(response.body)
        expect(result['notice']).to match(/already/)
      end
    end

  end
end
