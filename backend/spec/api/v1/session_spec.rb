require 'rails_helper'

describe 'Use session API' do
  before(:all) do
    #TODO: Remove this monkeypatch
    #https://github.com/rails/rails/issues/15843#issuecomment-125784043
    if defined?(::ActionDispatch::Request::Session) &&
        !::ActionDispatch::Request::Session.respond_to?(:each)
      class ActionDispatch::Request::Session
        def each(&block)
          hash = self.to_hash
          hash.each(&block)
        end
      end
    end
  end

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
