class CreateAnsewers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :text

      t.timestamps
    end
  end
end
