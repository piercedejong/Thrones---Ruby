class AddAliveToDeath < ActiveRecord::Migration[5.2]
  def change
    add_column :deaths, :alive, :float
    add_column :deaths, :dead, :float
    add_column :deaths, :wight, :float
  end
end
