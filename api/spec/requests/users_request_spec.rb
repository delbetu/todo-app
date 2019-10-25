require 'rails_helper'

RSpec.describe V1::UsersController, type: :request do
  describe '#create' do
    it 'fails when email is already taken' do
      User.create!(name: 'Name', email: 'valid@email.com', password: 'ValidPwd1')

      post '/api/v1/users', params: { user: { name: 'Name', email: 'valid@email.com', password: 'ValidPwd1' } }

      result = JSON.parse(response.body)
      expect(response).to have_http_status(:unprocessable_entity)
      expect(result['errors'].first).to match(/Email has already been taken/)
    end

    it 'fails when password does not respect policy' do
      post '/api/v1/users', params: { user: { name: 'Name', email: 'valid@email.com', password: 'invalid' } }

      result = JSON.parse(response.body)
      expect(response).to have_http_status(:unprocessable_entity)
      expect(result['errors'].first).to match(/Password/)
    end

    it 'generates a token for the given credentials' do
      post '/api/v1/users', params: { user: { name: 'Bruce', email: 'bruce@gotham.com', password: 'Test1234' } }


      result = JSON.parse(response.body)
      expect(response).to have_http_status :success
      expect(result['id']).to be_a(Integer)
    end

  end
end
