module Spree
  module Admin
    class AffiliatesController < Spree::Admin::ResourceController
      helper_method :affiliate_partial_exists?
      before_filter :layout_options, only: [:new, :edit]

      def index
        @affiliates = Affiliate.all.page(params[:page]).per(Spree::Config[:admin_products_per_page])
      end

      protected

        def affiliate_partial_exists? partial
          return false if partial.blank? 
          Affiliate.lookup_for_partial lookup_context, partial
        end

        def layout_options
          @layout_options = Spree::Affiliate.layout_options
        end
    end
  end
end
