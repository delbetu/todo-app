module Auth
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
end
