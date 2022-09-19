Rails.application.routes.draw do
  get 'post/index'
  get 'post/show'
  get 'post/new'
  get 'post/create'
  get 'post/edit'
  get 'post/update'
  get 'post/destroy'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "post#index"
end
