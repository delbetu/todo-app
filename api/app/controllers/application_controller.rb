class ApplicationController < ActionController::API
  # Configurable Role Based Authorization
  class Authorizer
    Unauthorized = Class.new(StandardError)

    # Given a user role returns a regular expression matiching which resources can access.
    def permission_assignment
      {
        'user' => /.*#.*/ # logged in user has access to every controller action.
      }
    end

    def initialize(controller:, action:, user_roles: )
      @resource = "#{controller.downcase}##{action.downcase}"
      @role = user_roles.last
    end

    def authorize!
      raise Unauthorized unless @resource.match?(permission_assignment[@role])
    end
  end

  def authorized_user_for(controller:, action:)
    user_id = Auth::TokenManager.decode(request_token).user_id
    user = User.find(user_id) # raise error if not found
    Authorizer.new(controller: controller, action: action, user_roles: ['user']).authorize!
    user
  end

  def request_token
    request.env['HTTP_AUTHORIZATION']
  end

  def current_user
    authorized_user_for(controller: controller_name, action: action_name)
  end
end
