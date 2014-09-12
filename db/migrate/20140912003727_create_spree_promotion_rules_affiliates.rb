class CreateSpreePromotionRulesAffiliates < ActiveRecord::Migration
  def change
    create_table :spree_affiliates_promotion_rules do |t|
      t.integer :affiliate_id
      t.integer :promotion_rule_id
    end
    add_index :spree_affiliates_promotion_rules, :affiliate_id
    add_index :spree_affiliates_promotion_rules, :promotion_rule_id
  end
end
