class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def show
    @products = Product.all
  end

end
