class AddAnswerToHouseQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :house_questions, :answer, :string, default: ""
  end
end
