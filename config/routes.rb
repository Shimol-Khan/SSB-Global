Rails.application.routes.draw do
  resources :contacts
  resources :announcements
  resources :records
  devise_for :users

  root to: 'static#index'

  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
    get '/users/password', to: 'devise/passwords#new'
  end

end
