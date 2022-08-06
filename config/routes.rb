Rails.application.routes.draw do
  devise_for :users 
  
  root 'home#homepage'
  get '/dashboard', to:"home#dashboard"

  
  #nested resource rotes
  resources :projects do
    resources :bugs
  end

 
end
