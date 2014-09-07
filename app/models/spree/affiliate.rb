module Spree
  class Affiliate < Spree::Base
    has_many :referred_records
    
    validates_presence_of :name, :path

    def referred_users
      referred_records.includes(:user).collect(&:user).compact
    end

    def referred_orders
      referred_records.includes({:user => :orders}).collect{|u| u.user.orders }.flatten.compact
    end

    def referred_count
      referred_records.count
    end
  end
end
