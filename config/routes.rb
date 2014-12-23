Rails.application.routes.draw do

  resources :transactions, only: [:new, :create]
  resources :subscriptions, only: [:index, :new, :create]

  devise_for :users, :controllers => { :registrations => "registrations" }

  resources :contacts do
    resources :calls
    collection do
      post :import
      get :database
    end

    resources :properties
  end

  resources :charges, only: [:new, :create]

  get 'static/home'
  get 'about', to: 'static#about', as: :static_about

  root to: 'static#home'
end
