class AddVenueColumnUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :venue_id, :integer, default: nil 
  end
end
