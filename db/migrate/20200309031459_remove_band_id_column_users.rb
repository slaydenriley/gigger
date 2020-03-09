class RemoveBandIdColumnUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :band_id, :integer
  end
end
