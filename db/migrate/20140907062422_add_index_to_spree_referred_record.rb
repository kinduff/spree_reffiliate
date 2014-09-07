class AddIndexToSpreeReferredRecord < ActiveRecord::Migration
  def change
    add_index :spree_referred_records, [:user_id, :referral_id, :affiliate_id], name: 'index_spree_referred_record_on_u_r_a'
  end
end
