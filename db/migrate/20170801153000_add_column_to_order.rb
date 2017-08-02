class AddColumnToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :total_price_incl_vat, :string
  end
end
