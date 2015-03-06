class OthersController < ApplicationController
	def upload
		user_id = session[:user_id]
		song = params[:song].original_filename
		directory = "public/uploads"
		path = File.join(directory, song);
		File.open(path, 'wb') { |f| f.write(params[:song].read) }
		playlist_id = session[:playlist]
		Song.create_song(song, nil, playlist_id, nil, session[:user_id])
		redirect_to '/profile'
	end

	def createPlaylist
		user_id = session[:user_id]
		@playlistName = params[:playlistName]
		new_playlist = Playlist.create_playlist(@playlistName, user_id)
		session[:playlist] = new_playlist.id
		redirect_to '/profile'
	end


end
