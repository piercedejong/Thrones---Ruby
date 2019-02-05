class AddPayedToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :payed, :boolean, default:false
  end
end
