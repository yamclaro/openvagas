class RemoveCollumDescriptionToPosition < ActiveRecord::Migration[7.2]
  def change
    remove_column :positions, :description
  end
end
