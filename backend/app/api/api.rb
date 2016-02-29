class API < Grape::API
  use Rack::Session::Cookie
  version 'v1'
  format :json
  prefix :api

  helpers do
    def session
      env['rack.session']
    end

    def current_user=(user)
      session[:user_id] = user.nil? ? nil : user.id
    end

    def current_user
      User.find(session[:user_id]) if session[:user_id]
    end

    def authorize!
      error!('401 Unauthorized', 401) unless current_user
    end
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    error_response(message: e.message, status: 404)
  end

  mount Todos::UserSessionApi
  mount Todos::ItemsApi
  mount Todos::GroupItemsApi
end
