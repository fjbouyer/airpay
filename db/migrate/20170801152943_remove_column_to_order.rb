class RemoveColumnToOrder < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :total_price_excl_vat, :string
  end
end
