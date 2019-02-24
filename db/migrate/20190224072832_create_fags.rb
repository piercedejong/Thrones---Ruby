class CreateFags < ActiveRecord::Migration[5.2]
  def change
    create_table :fags do |t|
      t.string :text
      t.integer :fid

      t.timestamps
    end
  end
end
