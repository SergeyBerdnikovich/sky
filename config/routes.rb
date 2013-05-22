Sky::Application.routes.draw do

  get "user_dashboard/dashboard"

  resources :additional_service_prices


  resources :additional_services


  resources :prices


  resources :working_hours


  resources :plans


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

  match '/vendor_wizards/step0' => "vendor_wizards#step0"
  match '/vendor_wizards/step2' => "vendor_wizards#step2"
  match '/vendor_wizards/step3' => "vendor_wizards#step3"
  match '/vendor_wizards/step4' => "vendor_wizards#step4"
  match '/vendor_wizards/step5' => "vendor_wizards#step5"
  match '/vendor_wizards/step6' => "vendor_wizards#step6"
  match '/vendor_wizards/step7' => "vendor_wizards#step7"
  match '/vendor_wizards/handler' => "vendor_wizards#handler"

  # match '/profiles/wizard1' => "profiles#wizard1"
  # match '/orders/wizard2' => "orders#wizard2"
  # match '/orders/wizard3' => "orders#wizard3"
  # match '/orders/wizard4' => "orders#wizard4"
  # match '/orders/wizard5' => "orders#wizard5"

  # match '/vendors/preview' => "vendors#preview"
  # match '/bank_accounts/wizard2' => "bank_accounts#wizard2"
  # match '/profiles/wizard3' => "profiles#wizard3"
  # match '/vendors/wizard5' => "vendors#wizard5"
  match '/vendors/banking' => "vendors#banking"
 
  match '/orders/my_orders' => "orders#my_orders"

  resources :bank_accounts

  resources :static_pages

  resources :profiles

  resources :vendors

  resources :properties

  resources :zips

  resources :schedules

  resources :orders

  resources :vendors

  resources :property_types

  resources :account_types

  devise_for :users, :controllers => {:registrations => 'registrations'}
end
