Rails.application.routes.draw do
  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'register' }

  resources :notes do
  end

  resources :roles

  get 'dashboard', to: 'dashboard#index'

  root to: 'pages#home'
end
