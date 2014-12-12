Rails.application.routes.draw do
  get 'static/home'  
  get 'about', to: 'static#about', as: :static_about

  root to: 'static#home'
end
