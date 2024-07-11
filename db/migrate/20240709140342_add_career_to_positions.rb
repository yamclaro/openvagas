class AddCareerToPositions < ActiveRecord::Migration[7.2]
  def change
    add_reference :positions, :career, null: false, foreign_key: true
  end
end
