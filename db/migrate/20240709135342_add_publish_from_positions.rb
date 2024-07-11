class AddPublishFromPositions < ActiveRecord::Migration[7.2]
  def change
    add_column :positions, :status, :boolean
  end
end
