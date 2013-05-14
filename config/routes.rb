Sky::Application.routes.draw do

  root :to => 'static_pages#welcome'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  match '/static_pages/welcome' => "static_pages#welcome"
  match '/static_pages/myaccount' => "static_pages#myaccount"

  match '/user_wizards/step0' => "user_wizards#step0"
  match '/user_wizards/step2' => "user_wizards#step2"
  match '/user_wizards/step3' => "user_wizards#step3"
  match '/user_wizards/step4' => "user_wizards#step4"
  match '/user_wizards/step5' => "user_wizards#step5"
  match '/user_wizards/step6' => "user_wizards#step6"
  match '/user_wizards/handler' => "user_wizards#handler"

  match '/profiles/wizard1' => "profiles#wizard1"
  match '/orders/wizard2' => "orders#wizard2"
  match '/orders/wizard3' => "orders#wizard3"
  match '/orders/wizard4' => "orders#wizard4"
  match '/orders/wizard5' => "orders#wizard5"

  match '/vendors/preview' => "vendors#preview"
  match '/bank_accounts/wizard2' => "bank_accounts#wizard2"
  match '/profiles/wizard3' => "profiles#wizard3"
  match '/vendors/wizard5' => "vendors#wizard5"
  match '/vendors/wizard6' => "vendors#wizard6"

  match '/orders/my_orders' => "orders#my_orders"

  resources :bank_accounts

  resources :static_pages

  resources :profiles

  resources :vendors

  resources :properties

  resources :schedules

  resources :orders

  resources :property_types

  resources :account_types

  devise_for :users, :controllers => {:registrations => 'registrations'}
end
