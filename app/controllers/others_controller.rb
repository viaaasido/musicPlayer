class OthersController < ApplicationController
	def upload
		user_id = session[:user_id]
		song = params[:song].original_filename
<<<<<<< HEAD
		directory = "public/uploads"
		path = File.join(directory, song);
		File.open(path, 'wb') { |f| f. write(params[:song].read) }
		playlist_id = session[:playlist]
		Song.create_song(song, nil, playlist_id, nil, session[:user_id])
=======
		directory = "app/assets/audios/uploads"
		str = "uploads/" + song
		path = File.join(directory, song);
		File.open(path, 'wb') { |f| f.write(params[:song].read) }
		playlist_id = session[:playlist]
		Song.create_song(song, nil, playlist_id, nil, session[:user_id], str)
		puts path
>>>>>>> a5b54fa8f96a0c65cb0020966f39edd3631c2efc
		redirect_to '/profile'
	end

	def createPlaylist
		user_id = session[:user_id]
		@playlistName = params[:playlistName]
		new_playlist = Playlist.create_playlist(@playlistName, user_id)
		session[:playlist] = new_playlist.id

		redirect_to '/profile'
	end

	def select_playlist
		session[:playlist] = Playlist.check(params[:name]).id
		redirect_to ''
	end

	def streamMusic
		session[:song] = Song.where(title: params[:song]).first.id
		redirect_to ''
	end
end
