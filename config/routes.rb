Rails.application.routes.draw do
  get ':username', to: 'users#show', as: :user
  # resources :users, only: [:show]
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  authenticated :user do
    root "posts#index", as: :authenticated_root
  end

  root "static_pages#home"
end
