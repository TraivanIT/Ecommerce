class SessionsController < ApplicationController
  layout 'customer'
  def new
  end

  def create
  	customer = Customer.find_by_email(params[:email])
  	if customer && customer.authenticate(params[:password])
      session[:customer_id] = customer.id
  		redirect_to root_url, notice: 'You have Logged in!'
  	else
  		flash[:alert] = "Email or password is invalid"
  		render :new
  	end
  end

  def destroy
  	session[:customer_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end

