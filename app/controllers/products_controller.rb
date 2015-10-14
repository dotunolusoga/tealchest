class ProductsController < ApplicationController
  before_filter :initialize_cart


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

  def update
    @product = Product.find(params[:id])
    @product.assign_attributes(product_params)
    if @product.save
      redirect_to products_path
      flash.notice = "Product has been updated"
    else
      flash.alert = "Please fix the errors below to continue"
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    if @product.destroy
      redirect_to products_path, notice: "Product has now been deleted."
    else
      flash.alert = "Product could not be deleted."
    end

  end


  protected

  def product_params
    params.require(:product).permit(:name, :description, :color, :image, :price_cents, :amount_available, :category_id)
  end

end
