Rails.application.routes.draw do
  scope :api do
    namespace :v1 do
      resource :user_session, only: [:create]

      resources :group_items do
        resources :items
      end
    end
  end
end
