require 'spec_helper'

describe Spree::UserRegistrationsController, :type => :controller do
  before { @request.env['devise.mapping'] = Devise.mappings[:spree_user] }

  context "#create" do
    it "should add referral_code param" do
      code = 'referral-code'
      session[:referral] = code
      spree_post :create, { spree_user: { email: 'foobar@example.com', password: 'foobar123', password_confirmation: 'foobar123' } }
      expect(controller.params[:spree_user][:referral_code]).to eql(code)
    end
    it "should add affiliate_code param" do
      code = 'affiliate-code'
      session[:affiliate] = code
      spree_post :create, { spree_user: { email: 'foobar@example.com', password: 'foobar123', password_confirmation: 'foobar123' } }
      expect(controller.params[:spree_user][:affiliate_code]).to eql(code)
    end
  end
end
