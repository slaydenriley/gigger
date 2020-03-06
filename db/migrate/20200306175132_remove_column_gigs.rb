class RemoveColumnGigs < ActiveRecord::Migration[6.0]
  def change
    remove_column :gigs, :time
  end
end
