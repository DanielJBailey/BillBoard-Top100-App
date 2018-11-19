Rails.application.routes.draw do

  
  root "boards#index"

  devise_for :users

  resources :boards do
    resources :artists
  end

  resources :artists do
    resources :songs 
  end


end
