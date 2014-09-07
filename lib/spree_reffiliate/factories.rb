FactoryGirl.define do
  factory :affiliate, class: Spree::Affiliate do
    name "Corona"
    path "corona"
    partial "corona"
  end

  factory :referral, class: Spree::Referral
  factory :referred_promotion_rule, class: Spree::ReferredPromotionRule
end
