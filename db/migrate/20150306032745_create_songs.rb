class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.integer :playlist_id
      t.string :album
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
