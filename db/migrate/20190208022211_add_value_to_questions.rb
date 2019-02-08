class AddValueToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :value, :integer
  end
end
