class CreateArtistGenres < ActiveRecord::Migration
  def change
    create_table :artist_genres do |t|
      t.references :artist, index: true
      t.references :genre, index: true
    end
    add_foreign_key :artist_genres, :artists
    add_foreign_key :artist_genres, :genres
  end
end
