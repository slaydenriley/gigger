class AddColumnBands < ActiveRecord::Migration[6.0]
  def change
    add_column :bands, :email, :text
  end
end
