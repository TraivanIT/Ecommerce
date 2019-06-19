class Admin::CustomersController < Admin::ApplicationController
  def index
  	@customers = Customer.all.order(id: :desc)
  end

  def show
  end
end
