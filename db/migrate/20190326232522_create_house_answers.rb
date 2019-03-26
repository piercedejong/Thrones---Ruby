class CreateHouseAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :house_answers do |t|
      t.string :text
      t.integer :aid
      t.boolean :correct
      t.timestamps
    end
  end
end
