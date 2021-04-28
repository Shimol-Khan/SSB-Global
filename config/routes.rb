Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  resources :contacts
  resources :announcements
  resources :records
  devise_for :users

  root to: 'static#index'

  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
    get '/users/password', to: 'devise/passwords#new'
  end

  get '/tracking', to: 'records#track', as: :tracking
  get '/result', to: 'records#result', as: :result

end
