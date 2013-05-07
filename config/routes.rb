Sky::Application.routes.draw do

  root :to => 'static_pages#welcome'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  match '/static_pages/welcome' => "static_pages#welcome"
  match '/orders/wizard2' => "orders#wizard2"

  resources :static_pages

  resources :profiles

  resources :schedules

  resources :orders

  resources :plans

  resources :property_types

  resources :account_types

  devise_for :users, :controllers => {:registrations => 'registrations'}
end
