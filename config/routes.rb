Sky::Application.routes.draw do

  root :to => 'static_pages#welcome'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  match '/static_pages/welcome' => "static_pages#welcome"

  match '/profiles/wizard1' => "profiles#wizard1"
  match '/orders/wizard2' => "orders#wizard2"
  match '/schedules/wizard3' => "schedules#wizard3"
  match '/orders/wizard4' => "orders#wizard4"

  resources :static_pages

  resources :profiles

  resources :schedules

  resources :orders

  resources :property_types

  resources :account_types

  devise_for :users, :controllers => {:registrations => 'registrations'}
end
