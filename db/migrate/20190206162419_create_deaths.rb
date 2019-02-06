class CreateDeaths < ActiveRecord::Migration[5.2]
  def change
    create_table :deaths do |t|
      t.string :name
      t.string :status, default: "alive"

      t.timestamps
    end
  end
end
