class AddPathToSong < ActiveRecord::Migration
  def change
    add_column :songs, :path, :string
  end
end
