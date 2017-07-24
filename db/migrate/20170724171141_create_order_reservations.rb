class CreateOrderReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :order_reservations do |t|
      t.references :reservation, foreign_key: true
      t.references :order, foreign_key: true
      t.integer :quantity
      t.float :total_price_excl_vat
      t.float :vat_rate

      t.timestamps
    end
  end
end
