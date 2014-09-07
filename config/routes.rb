Spree::Core::Engine.routes.draw do
  get 'r/:code' => 'reffiliate#referral', as: 'referral'
  get 'a/:path' => 'reffiliate#affiliate', as: 'affiliate'

  namespace :admin do
    resources :affiliates
  end
end
