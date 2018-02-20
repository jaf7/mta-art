class CreateArtworks < ActiveRecord::Migration[5.1]
  def change
    create_table :artworks do |t|
      t.integer :artist_id
      t.string :title
      t.string :url
    end
  end
end
