class ProductsController < ApplicationController


  def new
    @product = Product.new
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: "#{@product.name} has now been added"
    else
      flash.alert = "Product could not be saved. Please fix the errors to continue."
      render :new
    end
  end

  protected

  def product_params
    params.require(:product).permit(:name, :description, :color, :image, :price_cents, :amount_available)
  end

end
