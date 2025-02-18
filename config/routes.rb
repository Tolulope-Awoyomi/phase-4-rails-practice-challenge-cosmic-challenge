Rails.application.routes.draw do
  resources :missions, only: :create
  resources :planets, only: [:index, :show, :create, :update, :destroy]
  resources :scientists, only: [:index, :show, :create, :update, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
