class CreatePositionTypes < ActiveRecord::Migration[7.2]
  def change
    create_table :position_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
