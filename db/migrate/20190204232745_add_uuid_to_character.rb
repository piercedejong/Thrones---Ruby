class AddUuidToCharacter < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :uuid, :string
  end
end
