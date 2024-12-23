# added gender to this migration as string
class AddAgeAndLocationToProfiles < ActiveRecord::Migration[8.0]
  def change
    add_column :profiles, :birthday, :date
    add_column :profiles, :gender, :string
    add_column :profiles, :location, :string
  end
end
