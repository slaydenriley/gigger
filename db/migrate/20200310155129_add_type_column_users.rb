class AddTypeColumnUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :type, :text
  end
end
