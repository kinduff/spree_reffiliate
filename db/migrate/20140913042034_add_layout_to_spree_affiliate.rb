class AddLayoutToSpreeAffiliate < ActiveRecord::Migration
  def change
    add_column :spree_affiliates, :layout, :string
  end
end
