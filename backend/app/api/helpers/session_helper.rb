module SessionHelper
  extend Grape::API::Helpers

  def session
    env['rack.session']
  end

  def current_user=(user)
    session[:user_id] = user.nil? ? nil : user.id
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
end
