Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "users#index"
  resources :users,only:[:index,:show,:new,:create] do
    resources :posts,only:[:index,:show,:new,:create] do
      resources :comments, only: [:new,:create]
      resources :likes, only: [:create, :destroy]
    end
  end
end
