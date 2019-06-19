class PagesController < ApplicationController
  def home
  	@products = Product.all.order(id: :desc).page(params[:page]).per(12)

  	
  	
  end
  

  def about
  end

  def contact
  end
end
