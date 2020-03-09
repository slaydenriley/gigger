class CreateBandUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :band_users do |t|
      t.belongs_to :users
      t.belongs_to :bands

    end
  end
end
