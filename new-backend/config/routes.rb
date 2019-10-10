Rails.application.routes.draw do
  scope :api do
    namespace :v1 do
      resource :user_session, only: [:create]
    end
  end
end
