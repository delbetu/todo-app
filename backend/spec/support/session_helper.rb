module SessionHelper
  def login(email = nil, password = nil)
    email ||= 'test@todo.com'
    password ||= 'admin'
    user = User.create(email: email, password: password)
    allow_any_instance_of(SessionHelper).to receive(:current_user) { user }
    user
  end
end
