class AddColumnBands < ActiveRecord::Migration[6.0]
  def change
    add_column :bands, :email, :string
  end
end
