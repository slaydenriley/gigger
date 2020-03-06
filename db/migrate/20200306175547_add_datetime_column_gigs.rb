class AddDatetimeColumnGigs < ActiveRecord::Migration[6.0]
  def change
    add_column :gigs, :date, :datetime
  end
end
