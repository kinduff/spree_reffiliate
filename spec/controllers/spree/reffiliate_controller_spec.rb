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
      allow(controller).to receive(:partial_exists).and_return(true)
      expect {
        spree_get :affiliate, path: @affiliate.path
      }.to raise_error(ActionView::MissingTemplate) # no fake template
    end
  end
end
