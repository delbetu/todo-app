module Todos
  class UserSessionApi < Grape::API
    resource :user_session do
      desc 'Create user session'
      params do
        requires :email, type: String
        requires :password, type: String
      end
      post do
        return { notice: 'User already logged in' } if current_user

        user = User.authenticate(params[:email], params[:password])
        if user
          self.current_user = user
          { notice: 'User logged in' }
        else
          error!('403 Forbidden access', 403)
        end
      end

      desc 'Destroy user session'
      delete do
        authorize!
        self.current_user = nil
        { notice: 'User logged out' }
      end
    end
  end
end
