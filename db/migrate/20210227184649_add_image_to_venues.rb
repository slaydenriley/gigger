class AddImageToVenues < ActiveRecord::Migration[6.0]
  def change
    add_column :venues, :image_link, :string
  end
end
