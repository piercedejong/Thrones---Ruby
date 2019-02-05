class AddCidToCharacters < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :cid, :integer
  end
end
