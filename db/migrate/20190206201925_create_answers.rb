class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :text
      t.integer :rid
      t.integer :user_id
      t.boolean :correct, default: true

      t.timestamps
    end
  end
end
