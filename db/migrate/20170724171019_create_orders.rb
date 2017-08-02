class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :reservation, foreign_key: true
      t.integer :person_quantity
      t.integer :total_price_incl_vat_cents
      t.float :reservation_vat_rate
      t.string :status
      t.string :postal_code
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :email
      t.string :cart_snapshot
      t.json :payment

      t.timestamps
    end
  end
end
