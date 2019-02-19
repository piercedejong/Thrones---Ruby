class AddWordsToHouse < ActiveRecord::Migration[5.2]
  def change
    add_column :houses, :words, :string
  end
end
