Rails.application.routes.draw do
  devise_for :users
  resources :groups
  resources :entities
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  devise_scope :user do
    authenticated :user do
      root "groups#index", as: :authenticated_root
    end
    unauthenticated do
      root "users#splash", as: :unauthenticated_root
    end
  end
end
