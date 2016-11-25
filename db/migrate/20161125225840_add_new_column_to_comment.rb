class AddNewColumnToComment < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :timeline_id, :integer
  end
end
