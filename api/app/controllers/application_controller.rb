class ApplicationController < ActionController::API
  def authorized_user_for(controller:, action:)
    user_id = Auth::TokenManager.decode(request_token).user_id
    user = User.find(user_id) # raise error if not found
    Auth::Authorizer.new(controller: controller, action: action, user_roles: roles_for(user)).authorize!
    user
  end

  def roles_for(user)
    if user.persisted?
      ['user']
    else
      ['anonymous']
    end
  end

  def request_token
    request.env['HTTP_AUTHORIZATION']
  end

  def current_user
    authorized_user_for(controller: controller_name, action: action_name)
  end

  alias_method :authorize_user, :current_user
end
