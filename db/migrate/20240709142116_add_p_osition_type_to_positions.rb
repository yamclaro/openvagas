class AddPOsitionTypeToPositions < ActiveRecord::Migration[7.2]
  def change
    add_reference :positions, :position_type, foreign_key: true
  end
end
