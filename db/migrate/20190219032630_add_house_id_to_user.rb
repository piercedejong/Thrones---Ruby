class AddHouseIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :house_id, :integer
  end
end
