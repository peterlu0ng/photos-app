Rails.application.routes.draw do
  resources :images
  devise_for :users, :controllers => { :registrations => "registrations" }
  root 'welcome#index'

  get 'checkout', to: 'checkouts#show'
  get 'checkout/success', to: 'checkouts#success'
  get 'billing', to: 'billing#show'
end
