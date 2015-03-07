class Playlist < ActiveRecord::Base
	belongs_to :user
	has_many :songs
	def self.create_playlist(name, user_id)
		new_playlist = Playlist.create(name:name, user_id:user_id)
		new_playlist
	end

	def self.check(name)
		playlist = Playlist.where(name: name).first
		if playlist.present?
			playlist
		else
			nil
		end
	end
end
