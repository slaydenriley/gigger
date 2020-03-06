class CreateBands < ActiveRecord::Migration[6.0]
  def change
    create_table :bands do |t|
      t.string :name
      t.string :genre
      t.text :description
      t.integer :genre_id

      t.timestamps
    end
  end
end
