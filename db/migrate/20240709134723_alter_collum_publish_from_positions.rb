class AlterCollumPublishFromPositions < ActiveRecord::Migration[7.2]
  def change
    remove_column :positions, :publish, :string
    remove_column :positions, :boolean, :string
  end
end
