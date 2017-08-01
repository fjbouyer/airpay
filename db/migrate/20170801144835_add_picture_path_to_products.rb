class AddPicturePathToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :picture_path, :string
  end
end
