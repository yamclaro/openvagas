class RemoveCollumRemoteToPositions < ActiveRecord::Migration[7.2]
  def change
    remove_column :positions, :remote, :boolean
  end
end
