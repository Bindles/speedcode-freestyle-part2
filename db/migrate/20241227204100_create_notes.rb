class CreateNotes < ActiveRecord::Migration[8.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :content
      t.integer :position
      t.integer :parent_id

      t.timestamps
    end
  end
end
