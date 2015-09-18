class CreateUserArtists < ActiveRecord::Migration
  def change
    create_table :user_artists do |t|
      t.references :user, index: true
      t.references :artist, index: true
    end
    add_foreign_key :user_artists, :users
    add_foreign_key :user_artists, :artists
  end
end
