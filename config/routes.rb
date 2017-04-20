Rails.application.routes.draw do
  root 'matches#index'

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :matches, only:[:index]

  namespace 'admin' do
    resources :matches, only:[:index, :create]
    resources :users, only: [:index, :update]
  end
end
