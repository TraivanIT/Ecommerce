class ApplicationController < ActionController::Base


helper_method :current_customer

  def current_customer
    if session[:customer_id]
      @current_customer ||= Customer.find(session[:customer_id])
    else
      @current_customer = nil
    end
  end
end
