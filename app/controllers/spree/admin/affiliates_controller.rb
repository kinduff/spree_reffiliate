module Spree
  module Admin
    class AffiliatesController < Spree::Admin::ResourceController
      helper_method :affiliate_partial_exists?

      def index
        @affiliates = Affiliate.all.page(params[:page]).per(Spree::Config[:admin_products_per_page])
      end

      def affiliate_partial_exists? partial
        return false if partial.blank? 
        lookup_context.template_exists?(partial, ["spree/affiliates"], false)
      end
    end
  end
end
