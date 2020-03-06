class RemoveDateColumnGigs < ActiveRecord::Migration[6.0]
  def change
    remove_column :gigs, :date
  end
end
