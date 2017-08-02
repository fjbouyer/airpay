class AddMinimumPlayersToCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :sport_categories, :minimum_players, :integer
  end
end
