class CreateStreetFighters < ActiveRecord::Migration[8.0]
  def change
    create_table :street_fighters do |t|
      t.string :quote
      t.string :character
      t.string :move

      t.timestamps
    end
  end
end
