Rails.application.routes.draw do
  # resources :users, param: :username, only: [:show]
  resources :posts, only: [:new, :create, :index, :show] do
    resources :comments
    member do
      get :like
      get :unlike
    end
  end
  get ':username', to: 'users#show', as: :user
  # resources :users, param: :username, as: :user

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  resources :users do
    member do
      get :send_friend_request
      get :cancel_friend_request
      get :accept_received_request
      get :decline_received_request
    end
  end

  

  authenticated :user do
    root "posts#index", as: :authenticated_root
  end

  root "static_pages#home"
end
