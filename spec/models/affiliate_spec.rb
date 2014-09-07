require 'spec_helper'

describe Spree::Affiliate, :type => :model do
  it "should have a name" do
    affiliate = FactoryGirl.build(:affiliate, name: nil)
    expect(affiliate).to_not be_valid
  end
  it "should have a path" do
    affiliate = FactoryGirl.build(:affiliate, path: nil)
    expect(affiliate).to_not be_valid
  end

  context "with user" do
    before do
      @affiliate = FactoryGirl.create(:affiliate)
      @affiliated = FactoryGirl.create(:user, affiliate_code: @affiliate.path)
      @order = FactoryGirl.create(:order, :user => @affiliated)
    end

    it "returns an array of user records" do
      expect(@affiliate.referred_users).to eq([@affiliated])
    end
    it "returns an array of referred orders" do
      expect(@affiliate.referred_orders).to eq([@order])
    end
    it "returns referred count" do
      expect(@affiliate.referred_count).to eq(1)
    end
    it "returns an array of referred orders" do
      expect(@affiliate.referred_records).to eq([@affiliated.affiliate_record])
    end
  end
end
