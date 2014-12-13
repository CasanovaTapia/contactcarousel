Rails.application.routes.draw do
  get 'conversations/new'

  get 'dials/new'

  resources :contacts

  get 'static/home'  
  get 'about', to: 'static#about', as: :static_about

  root to: 'static#home'
end
