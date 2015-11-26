Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  root to: "restaurants#index"

  resources :restaurants do
    resources :reviews
  end
end
