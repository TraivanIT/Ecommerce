class Admin::ProductsController < Admin::ApplicationController 
  def index
    @products = Product.all.order(id: :desc).page(params[:page]).per(10)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.moderator_id = current_moderator.id
    if @product.save
      redirect_to admin_products_path, notice: 'Product was successful created'
    else
      flash[:alert] = 'Product was not successful created'
      render :new
    end

  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_products_url, notice: 'Product was successful update'
    else
      flash[:alert] = ' Product was not update'
      render :edit
    end
        
  end

  def destroy
  end

  private 
    def product_params
      params.require(:product).permit(:id , :product_name , :product_price, :product_image , :description, :moderator_id )
    end
    
end
