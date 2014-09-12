FactoryGirl.define do
  factory :affiliate, class: Spree::Affiliate do
    name Faker::Name.first_name
    path Faker::Name.first_name
    partial Faker::Name.first_name
  end

  factory :referral, class: Spree::Referral
  factory :referred_promotion_rule, class: Spree::ReferredPromotionRule
  factory :affiliated_promotion_rule, class: Spree::AffiliatedPromotionRule
end
