class RemoveColumnToProduct < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :price_excl_vat, :string
  end
end
