class AddColumnVenues < ActiveRecord::Migration[6.0]
  def change
    add_column :venues, :email, :string
  end
end
