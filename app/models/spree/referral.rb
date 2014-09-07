module Spree
  class Referral < Spree::Base
    belongs_to :user, class_name: Spree.user_class.to_s
    has_many :referred_records

    before_create :create_code

    def create_code
      self.code = (0...8).map { (65 + rand(26)).chr }.join
      self
    end

    def referred_users
      referred_records.includes(:user).collect(&:user).compact
    end

    def referred_orders
      referred_records.includes({:user => :orders}).collect{|u| u.user.orders }.flatten.compact
    end
  end
end
