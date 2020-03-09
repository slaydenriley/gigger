class RemoveVenueColumnUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :venue_id, :integer
  end
end
