module Spree
  module Admin
    class AffiliatesController < Spree::Admin::ResourceController
      helper_method :affiliate_partial_exists?

      def index
        @affiliates = Affiliate.all.page(params[:page]).per(Spree::Config[:admin_products_per_page])
      end

      protected

        def affiliate_partial_exists? partial
          return false if partial.blank? 
          Affiliate.lookup_for_partial lookup_context, partial
        end
    end
  end
end
