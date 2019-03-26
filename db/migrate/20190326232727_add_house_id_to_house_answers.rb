class AddHouseIdToHouseAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :house_answers, :house_id, :integer
    add_column :house_answers, :user_id, :integer
  end
end
