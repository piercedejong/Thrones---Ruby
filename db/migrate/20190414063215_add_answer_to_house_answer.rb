class AddAnswerToHouseAnswer < ActiveRecord::Migration[5.2]
  def change
    add_column :house_answers, :answer, :string
  end
end
