class CreateGigs < ActiveRecord::Migration[6.0]
  def change
    create_table :gigs do |t|
      t.text :name
      t.date :date
      t.time :time
      t.integer :band_id
      t.integer :venue_id

      t.timestamps
    end
  end
end
