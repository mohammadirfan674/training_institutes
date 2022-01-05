Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  resources :contacts
  root 'courses#index'
  resources :courses do
    resources :fees
  end
  get '/home', to: 'courses#home'
  get '/about_us', to: 'courses#about_us'

  resources :profiles
  # root to: "home#index"
end
