module Auth
  class Authenticator
    AuthenticatedUser = Value.new(:authenticated, :user)

    # Check credentials
    def self.authenticate(email, password, data_provider: User)
      user = data_provider.find_by_email(email)
      if user && user.password == password
        AuthenticatedUser.with(authenticated: true, user: user)
      else
        AuthenticatedUser.with(authenticated: false)
      end
    end
  end
end
