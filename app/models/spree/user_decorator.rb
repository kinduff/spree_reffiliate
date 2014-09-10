module Spree
  Spree.user_class.class_eval do
    has_one :referral
    has_one :referred_record
    has_one :affiliate, through: :referred_record, foreign_key: :affiliate_id
    has_one :affiliate_record, class_name: ReferredRecord

    attr_accessor :referral_code, :affiliate_code

    after_create :create_referral
    after_create :referral_affiliate_check

    def referred_by
      referred_record.try(:referral).try(:user)
    end
    
    def referred_count
      referral.referred_records.count
    end

    def referred?
      !referred_record.try(:referral).try(:user).nil?
    end

    def affiliate?
      !affiliate.nil?
    end

    private
      def referral_affiliate_check
        if !self.referral_code.nil?
          referred = Referral.find_by(code: referral_code)
        elsif !self.affiliate_code.nil?
          referred = Affiliate.find_by(path: affiliate_code)
        end
        if referred
          referred.referred_records.create(user: self)
        end
      end
  end
end
