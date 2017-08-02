class RemoveColumnToReservation < ActiveRecord::Migration[5.0]
  def change
    remove_column :reservations, :price_per_hour_excl_vat, :string
  end
end
