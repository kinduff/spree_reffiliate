module Spree
  class Promotion
    module Rules
      class AffiliatedPromotionRule < Spree::PromotionRule
        belongs_to :affiliate, :class_name => '::Spree::Affiliate'
        has_and_belongs_to_many :affiliates, :class_name => '::Spree::Affiliate',
          :join_table => 'spree_affiliates_promotion_rules', :foreign_key => 'promotion_rule_id',
          :association_foreign_key => 'affiliate_id'

        def eligible?(order, options = {})
          return true if order.user and order.user.affiliate? and affiliates.collect(&:id).include?(order.user.affiliate.id)
          false
        end

        def applicable?(promotable)
          promotable.is_a?(Spree::Order)
        end

        def affiliate_ids_string
          affiliate_ids.join(',')
        end

        def affiliate_ids_string=(s)
          self.affiliate_ids = s.to_s.split(',').map(&:strip)
        end

        def affiliate_list
          affiliate_ids
        end

        def affiliate_list=(a)
          self.affiliate_ids = a
        end
      end
    end
  end
end
