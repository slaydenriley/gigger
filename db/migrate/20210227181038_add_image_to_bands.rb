class AddImageToBands < ActiveRecord::Migration[6.0]
  def change
    add_column :bands, :image_link, :string
  end
end
