class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.boolean :dead, default: false
      t.boolean :walker, default: false
      t.string :user_uuid

      t.timestamps
    end
  end
end
