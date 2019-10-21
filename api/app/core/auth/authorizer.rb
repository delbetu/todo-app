module Auth
  # Configurable Role Based Authorization
  class Authorizer
    Unauthorized = Class.new(StandardError)

    def permission_assignment
      {
        'anonymous' => /AuthTokenController#create/,
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
end
