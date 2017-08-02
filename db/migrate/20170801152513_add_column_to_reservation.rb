class AddColumnToReservation < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :price_per_hour_incl_vat, :string
  end
end
