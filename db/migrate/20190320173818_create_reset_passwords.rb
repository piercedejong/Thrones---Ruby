class CreateResetPasswords < ActiveRecord::Migration[5.2]
  def change
    create_table :reset_passwords do |t|

      t.timestamps
    end
  end
end
