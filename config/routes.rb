Spree::Core::Engine.routes.draw do
  get 'r/:code' => 'referral#referral', as: 'referral'
  get 'a/:path' => 'referral#affiliate', as: 'affiliate'

  namespace :admin do
    resources :affiliates
  end
end
