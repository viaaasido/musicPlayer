class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login

  def current_user
  	User.where(id: session[:user_id]).first
  end


  def require_login
  	redirect_to '/home' if session[:user_id].nil?
  end

  def profile
    @playlists = Playlist.where(user_id: session[:user_id]).to_a
    @currUser = User.where(id: session[:user_id]).first
  end

  def home
    if session[:user_id].nil?
      redirect_to '/home' 
    else
      redirect_to '/profile'
    end
  end
end
