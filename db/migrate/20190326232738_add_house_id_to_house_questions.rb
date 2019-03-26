class AddHouseIdToHouseQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :house_questions, :house_id, :integer
  end
end
