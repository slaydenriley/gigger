class RemoveGenreColumnBands < ActiveRecord::Migration[6.0]
  def change
    remove_column :bands, :genre
  end
end
