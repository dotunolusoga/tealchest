class OrdersController < ApplicationController
  before_filter :initialize_cart

  def index
  end

  def create
    @order_form = OrderForm.new(
      user: User.new(order_params[:user]),
      cart: @cart
    )
    if @order_form.save
      notify_user
      redirect_to root_url, notice: "Thank you for placing the order"
    else
      render "carts/checkout"
    end
  end

  private

  def notify_user
    @order_form.user.send_reset_password_instructions
    OrderMailer.order_confirmation(@order_form.order).deliver
  end


  def order_params
    params.require(:order_form).permit(
      user: [ :name, :email, :phone, :address, :city, :country, :postal_code ]
    )
  end
end
