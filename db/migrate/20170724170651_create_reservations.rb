class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.references :sport_category, foreign_key: true
      t.references :user, foreign_key: true
      t.date :date
      t.date :time
      t.integer :number_of_hour
      t.integer :price_per_hour_cent_incl_vat
      t.float :vat_rate

      t.timestamps
    end
  end
end
