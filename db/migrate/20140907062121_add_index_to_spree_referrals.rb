class AddIndexToSpreeReferrals < ActiveRecord::Migration
  def change
    add_index :spree_referrals, :user_id
  end
end
