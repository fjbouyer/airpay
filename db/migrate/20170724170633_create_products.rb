class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.references :product_category, foreign_key: true
      t.integer :price_incl_vat_cents
      t.float :vat_rate

      t.timestamps
    end
  end
end
