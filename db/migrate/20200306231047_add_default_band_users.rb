class AddDefaultBandUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :band_id, :integer, default: nil
  end
end
