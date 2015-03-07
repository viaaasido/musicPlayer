class OthersController < ApplicationController
	def upload
		
		redirect_to '/profile'
	end

	def createPlaylist
		user_id = session[:user_id]
		@playlistName = params[:playlistName]
		new_playlist = Playlist.create_playlist(@playlistName, user_id)
		redirect_to '/profile'
	end
end
