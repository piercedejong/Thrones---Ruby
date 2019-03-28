class AddEpidoeToHouseAnswer < ActiveRecord::Migration[5.2]
  def change
    add_column :house_answers, :episode, :integer
    add_column :house_questions, :episode, :integer
  end
end
