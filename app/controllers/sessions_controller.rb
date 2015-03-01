class SessionsController < ApplicationController
	skip_before_action :require_login, except: :logout
	def login_page
		if session[:user_id]
			redirect_to '/profile'
		end
	end

	def login
		user = User.authenticate(params[:username], params[:password])
		if user
			session[:user_id] = user.user_id
			redirect_to '/profile'
		else
			redirect_to action: :login_page
		end
	end

	def logout
		session[:user_id] = nil
		redirect_to action: :main
	end

	def signup_page
		if session[:user_id]
			redirect_to '/profile'
		end
	end

	def signup
		user = User.create_user(params[:name], params[:username], params[:password], params[:password_confirm])
		if user
			session[:user_id] = User.authenticate(params[:username], params[:password]).user_id
			redirect_to '/profile'
		else
			redirect_to action: :signup_page
		end
	end

	def main
		redirect_to root_path
	end

	def home
		if session[:user_id]
			redirect_to '/profile'
		end
	end
end