class AddQidToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :qid, :integer
  end
end
