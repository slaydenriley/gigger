class AddUidColumnUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :uid, :text
    add_column :users, :provider, :text
    add_column :users, :image, :text
  end
end
