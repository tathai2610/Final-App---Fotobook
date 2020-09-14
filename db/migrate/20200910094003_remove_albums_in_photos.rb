class RemoveAlbumsInPhotos < ActiveRecord::Migration[6.0]
  def change
    remove_column :photos, :albums_id
    add_reference :photos, :album, foreign_key: true, optional: true
  end
end
