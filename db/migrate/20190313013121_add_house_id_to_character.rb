class AddHouseIdToCharacter < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :house_id, :integer
  end
end
