class AddValueToHouseQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :house_questions, :value, :integer, default: 0
  end
end
