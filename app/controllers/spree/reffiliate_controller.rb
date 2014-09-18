module Spree
  class ReffiliateController < Spree::StoreController
    def referral
      session[:referral] = params[:code]
      redirect_to root_path
    end
    def affiliate
      session[:affiliate] = params[:path]
      affiliate = Spree::Affiliate.find_by(:path => params[:path])
      if affiliate.nil? or affiliate.partial.blank? or !partial_exists affiliate.partial
        redirect_to(root_path)
      elsif partial_exists affiliate.partial
        render "spree/affiliates/#{affiliate.partial}", :layout => affiliate.get_layout
      end
    end

    private
      def partial_exists partial
        Affiliate.lookup_for_partial lookup_context, partial
      end
  end
end
