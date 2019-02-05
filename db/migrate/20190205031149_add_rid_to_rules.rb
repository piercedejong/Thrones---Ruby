class AddRidToRules < ActiveRecord::Migration[5.2]
  def change
    add_column :rules, :rid, :integer
  end
end
