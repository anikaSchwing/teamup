Rails.application.routes.draw do
  root 'matches#index'

  devise_for :users
  resources :matches, only:[:index]

  namespace 'admin' do
    resources :matches, only:[:index]
    resources :users, only: [:index, :update]
  end
end
