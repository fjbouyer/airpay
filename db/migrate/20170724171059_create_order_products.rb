class CreateOrderProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :order_products do |t|
      t.references :product, foreign_key: true
      t.references :order, foreign_key: true
      t.integer :quantity
      t.integer :product_price_cent_incl_vat
      t.float :product_vat_rate

      t.timestamps
    end
  end
end
