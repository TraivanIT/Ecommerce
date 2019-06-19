class Admin::SessionsController < Admin::ApplicationController 

  layout 'login'
	before_action :authorize, except: [:new , :create]

  def new
  end

  def create
  	@moderator = Moderator.find_by(username: params[:username]).try(:authenticate, params[:password])
  	#after find_by and authenticate that the one true we create session
  	if @moderator
  		session[:current_moderator_id] = @moderator.id
  		redirect_to admin_moderators_url, notice: 'You have successful login'
  	else
  		flash[:alert] = 'You Enter incorrect username or password'
  		render :new

  	end 

  end

  def destroy
  	session[:current_moderator_id] = nil
  	redirect_to '/login', notice: 'You have successful logged out'
  end
end
