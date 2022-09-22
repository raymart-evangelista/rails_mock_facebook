Rails.application.routes.draw do
  get ':username', to: 'users#show', as: :user
  # resources :users, param: :username, only [:show]

  devise_for :users

  resources :users do
    member do
      get :toggle_add_friend
    end
  end

  authenticated :user do
    root "posts#index", as: :authenticated_root
  end

  root "static_pages#home"
end
