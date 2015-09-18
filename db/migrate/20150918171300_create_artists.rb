class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :url
      t.integer :followers

      t.timestamps null: false
    end
  end
end
