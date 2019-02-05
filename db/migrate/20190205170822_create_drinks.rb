class CreateDrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :drinks do |t|
      t.string :rule
      t.boolean :finish, default: false
      t.boolean :hardcore, default: false

      t.timestamps
    end
  end
end
