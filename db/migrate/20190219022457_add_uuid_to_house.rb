class AddUuidToHouse < ActiveRecord::Migration[5.2]
  def change
    add_column :houses, :uuid, :string
  end
end
