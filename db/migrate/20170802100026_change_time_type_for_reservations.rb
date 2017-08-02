class ChangeTimeTypeForReservations < ActiveRecord::Migration[5.0]
  def up
    change_column :reservations, :time, :datetime
  end

  def down
    change_column :reservations, :time, :date
  end
end
