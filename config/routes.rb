Rails.application.routes.draw do
  root 'matches#index'

  devise_for :users
  resources :matches, only:[:index]
end
