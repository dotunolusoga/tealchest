class ProductsController < ApplicationController

  def show
    @products = Product.all
  end
  
end
