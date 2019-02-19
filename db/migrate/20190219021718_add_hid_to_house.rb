class AddHidToHouse < ActiveRecord::Migration[5.2]
  def change
    add_column :houses, :image, :string
    add_column :houses, :points, :integer
    add_column :houses, :hid, :integer
    add_column :houses, :name, :string
  end
end
