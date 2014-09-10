Spree::PermittedAttributes.user_attributes.push :referral_code, :affiliate_code
config = Rails.application.config
config.after_initialize do
  config.spree.promotions.rules << Spree::ReferredPromotionRule
  config.spree.promotions.rules << Spree::AffiliatedPromotionRule
end
