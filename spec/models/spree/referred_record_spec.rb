require 'spec_helper'

describe Spree::ReferredRecord, :type => :model do
  before(:each) do
    @user = FactoryGirl.create(:user, email: Faker::Internet.email)
    @referred = FactoryGirl.create(:user, email:  Faker::Internet.email, referral_code: @user.referral.code)
    @referral_record = @referred.referred_record
  end

  it "has a user id" do
    expect(@referral_record.user_id).not_to be_nil
  end

  it "has a referral id" do
    expect(@referral_record.referral_id).not_to be_nil
  end

  it "returns an associated user record" do
    expect(@referral_record.referral.user).to eq(@user)
  end

  it "returns an associated referred user record" do
    expect(@referral_record.user).to eq(@referred)
  end

  it "returns an associated referral record" do
    expect(@referral_record.referral).to eq(@user.referral)
  end
end
