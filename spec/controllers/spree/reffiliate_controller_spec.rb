require 'spec_helper'

describe Spree::ReffiliateController, :type => :controller do
  context "referral hyperlink" do
    it "redirects to root path" do
      spree_get :referral
      expect(response).to redirect_to('/')
    end
    it "creates session variable with referral code" do
      code = 'referral-code'
      spree_get :referral, code: code
      expect(session[:referral]).to eq(code)
    end
  end
  context "affiliate hyperlink" do
    before (:each) do
      @affiliate = FactoryGirl.create(:affiliate)
    end
    it "creates session variable with affiliate path" do
      path = 'affiliate'
      spree_get :affiliate, :path => path
      expect(session[:affiliate]).to eq(path)
    end
    it "redirects to root path if path params is nil" do
      spree_get :affiliate
      expect(response).to redirect_to('/')
    end
    it "redirects to root path if affiliate has no partial" do
      spree_get :affiliate, path: @affiliate.path
      expect(response).to redirect_to('/')
    end
    it "redirects to root path if affiliate partial is not found" do
      spree_get :affiliate, path: @affiliate.path
      expect(response).to redirect_to('/')
    end
    it "renders a partial if affiliate partial is found" do
      @affiliate.update_attribute :partial, 'corona'
      controller.prepend_view_path 'spec/assets'
      spree_get :affiliate, path: @affiliate.path
      response.should render_template('spree/affiliates/corona')
    end
    context "layout options" do
      @options = Hash[Spree::Affiliate.layout_options]
      @options.each do |layout, option|
        it "#{layout}" do
          option = 'layouts/application' if option.nil?
          @affiliate = FactoryGirl.create(:affiliate, name: layout, path: layout, partial: 'corona', layout: option)
          controller.prepend_view_path 'spec/assets'
          allow(controller).to receive(:partial_exists).and_return(true)
          spree_get :affiliate, path: @affiliate.path
          response.should render_template(layout: @affiliate.get_layout)
        end
      end 
    end
  end
end
