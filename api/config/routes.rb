Rails.application.routes.draw do
  scope :api do
    namespace :v1 do
      resources :auth_token, only: [:create]
      post :user_session, to: 'auth_token#create' # TODO: temporally support legacy url

      resources :users, only: [:create]

      resources :group_items do
        resources :items
      end
    end
  end
end
