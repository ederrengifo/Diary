class CreateNoPasswords < ActiveRecord::Migration[5.0]
  def change
    create_table :no_passwords do |t|
      t.string :text

      t.timestamps
    end
  end
end
