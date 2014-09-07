module Spree
  class AffiliatedPromotionRule < Spree::PromotionRule
    def eligible?(order, options = {})
      return true if order.user and order.user.affiliate?
      false
    end
    def applicable?(promotable)
      promotable.is_a?(Spree::Order)
    end
  end
end
