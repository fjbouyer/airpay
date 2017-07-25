class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :reservation, foreign_key: true
      t.string :status
      t.integer :quantity
      t.float :total_price_excl_vat
      t.float :vat_rate

      t.timestamps
    end
  end
end
