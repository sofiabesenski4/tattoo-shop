class AddBookableToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :spree_products, :bookable, :boolean, default: false, null: false
  end
end
