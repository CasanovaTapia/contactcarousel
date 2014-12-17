Rails.application.routes.draw do
  devise_for :users

  resources :contacts do
    resources :properties
  end

  resources :charges, only: [:new, :create]

  get 'static/home'
  get 'about', to: 'static#about', as: :static_about

  root to: 'static#home'
end
