class DropAlbumsPhotosTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :albums_photos
    add_reference :photos, :album, foreign_key: true, optional: true
  end
end
