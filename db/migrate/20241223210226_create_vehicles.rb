class CreateVehicles < ActiveRecord::Migration[8.0]
  def change
    create_table :vehicles do |t|
      t.string :type
      t.string :Vehicle
      t.string :make
      t.string :model
      t.string :color
      t.integer :price
      t.string :size
      t.string :engine_size
      t.integer :top_speed

      t.timestamps
    end
  end
end
