class API < Grape::API
  use Rack::Session::Cookie
  version 'v1'
  format :json
  prefix :api

  helpers do
    def authorize!
      error!('401 Unauthorized', 401) unless current_user
    end
  end

  helpers SessionHelper

  rescue_from ActiveRecord::RecordNotFound do |e|
    error_response(message: e.message, status: 404)
  end

  mount Todos::UserSessionApi
  mount Todos::ItemsApi
  mount Todos::GroupItemsApi
end
