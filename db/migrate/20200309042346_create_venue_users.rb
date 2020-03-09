class CreateVenueUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :venue_users do |t|
      t.integer :user_id
      t.integer :venue_id
      
      t.timestamps
    end
  end
end
