class Admin::ApplicationController < ActionController::Base
	#before any method in controller run they have to authorize
	layout 'admin'
	before_action :authorize

	def current_moderator
		@moderator ||= Moderator.find(session[:current_moderator_id]) if session[:current_moderator_id] 
	end

	def authorize
		unless current_moderator
			redirect_to '/login', alert: 'Please login to views admin page'
		end
	end

end