class Song < ActiveRecord::Base
	belongs_to :playlist
	def self.create_song(title, artist, playlist_id, album, user_id)
		new_song = Song.create(title: title, artist:artist, playlist_id:playlist_id, album:album, user_id:user_id)
		new_song
	end
end
