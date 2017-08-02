class AddColumnToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :price_incl_vat, :string
  end
end
