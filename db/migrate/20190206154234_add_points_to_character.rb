class AddPointsToCharacter < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :points, :integer, default: 0
  end
end
