class CreateBandUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :band_users do |t|
      t.integer :user_id
      t.integer :band_id
    end
  end
end
