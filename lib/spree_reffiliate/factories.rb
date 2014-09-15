FactoryGirl.define do
  factory :affiliate, class: Spree::Affiliate do
    name Faker::Name.first_name
    path Faker::Name.first_name
    partial Faker::Name.first_name
    layout nil
  end

  factory :referral, class: Spree::Referral
  factory :referred_promotion_rule, class: Spree::Promotion::Rules::ReferredPromotionRule
  factory :affiliated_promotion_rule, class: Spree::Promotion::Rules::AffiliatedPromotionRule
end
