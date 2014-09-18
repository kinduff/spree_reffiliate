module Spree
  class Promotion
    module Rules
      class ReferredPromotionRule < Spree::PromotionRule
        def eligible?(order, options = {})
          return true if order.user and order.user.referred?
          false
        end
        def applicable?(promotable)
          promotable.is_a?(Spree::Order)
        end
      end
    end
  end
end
