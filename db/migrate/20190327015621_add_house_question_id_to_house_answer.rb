class AddHouseQuestionIdToHouseAnswer < ActiveRecord::Migration[5.2]
  def change
    add_column :house_answers, :house_question_id, :integer
  end
end
