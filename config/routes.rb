Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  # devise_for :users, :controllers => { registrations: 'registrations' }
  resources :tweeets do
    resources :comments, only: %i[new create show update index]
  end
  resources :comments, only: %i[destroy]

  root to: 'tweeets#index'
end
