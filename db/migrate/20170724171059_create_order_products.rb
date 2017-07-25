class CreateOrderProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :order_products do |t|
      t.references :product, foreign_key: true
      t.references :order, foreign_key: true
      t.integer :quantity
      t.float :product_price
      t.float :total_price
      t.float :vat_rate

      t.timestamps
    end
  end
end
