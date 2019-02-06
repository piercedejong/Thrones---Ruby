class AddDidToDeath < ActiveRecord::Migration[5.2]
  def change
    add_column :deaths, :did, :integer
  end
end
