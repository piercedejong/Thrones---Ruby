class CreateHouseQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :house_questions do |t|
      t.string :text
      t.integer :qid

      t.timestamps
    end
  end
end
