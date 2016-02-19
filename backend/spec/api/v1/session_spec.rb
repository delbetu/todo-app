require 'rails_helper'

describe 'Use session API' do
  it 'login - logout' do
    user = User.create(email: 'user@test.com', password: 'test')

    post '/api/v1/user_session', { email: 'user@test.com', password: 'test' }

    expect(response).to be_success
    expect(session[:user_id]).to eq(user.id)

    delete '/api/v1/user_session'

    expect(response).to be_success
    expect(session[:user_id]).to be_nil
  end

  it 'logout without previous login' do
    delete '/api/v1/user_session'

    expect(response.status).to eq(401)
  end
end
