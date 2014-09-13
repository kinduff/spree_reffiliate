require 'spec_helper'

describe Spree::Promotion::Rules::AffiliatedPromotionRule, :type => :model do
  before do
    @affiliate = FactoryGirl.create(:affiliate, path: 'corona')
    @affiliated = FactoryGirl.create(:user, email:  Faker::Internet.email, affiliate_code: @affiliate.path)
    @affiliated_order = FactoryGirl.create(:order, :user_id => @affiliated.id)

    @falsy_affiliate = FactoryGirl.create(:affiliate, path: 'victoria')
    @falsy_affiliated = FactoryGirl.create(:user, email:  Faker::Internet.email, affiliate_code: @falsy_affiliate.path)
    @falsy_affiliated_order = FactoryGirl.create(:order, :user_id => @falsy_affiliated.id)

    @user = FactoryGirl.create(:user, email: Faker::Internet.email)
    @organic_order = FactoryGirl.create(:order, :user_id => @user)

    @rule = FactoryGirl.build(:affiliated_promotion_rule)
    @rule.affiliate_list = [@affiliate.id]
  end

  it "is applicable for an order" do
    expect(@rule.applicable?(@affiliated_order)).to be_truthy
  end
  it "is elegible for affiliated user" do
    expect(@rule.eligible?(@affiliated_order)).to be_truthy
  end
  it "is not elegible for organic user" do
    expect(@rule.eligible?(@organic_order)).to be_falsy
  end
  it "is not elegible for falsy affiliated user" do
    expect(@rule.eligible?(@falsy_affiliated_order)).to be_falsy
  end
  it "returns string selected affiliate ids" do
    expect(@rule.affiliate_ids_string).to eq(@affiliate.id.to_s)
  end
  it "accepts string to assign affiliate ids" do
    @rule.affiliate_ids_string = "1"
    expect(@rule.affiliate_ids_string).to eq(@affiliate.id.to_s)
  end
  it "returns an array of affiliate ids" do
    expect(@rule.affiliate_list).to eq([@affiliate.id])
  end
  it "accepts an array to assign affiliate ids" do
    @rule.affiliate_list << [1]
    expect(@rule.affiliate_list).to eq([@affiliate.id])
  end
end
