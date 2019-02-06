class AddCorrectToAnswer < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :correct, :boolean, defualt:false
  end
end
