class RemoveCareerFromPositions < ActiveRecord::Migration[7.2]
  def change
    remove_column :positions, :career, :integer
  end
end
