class AddStautsToCharacter < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :status, :string, default: "none"
  end
end
