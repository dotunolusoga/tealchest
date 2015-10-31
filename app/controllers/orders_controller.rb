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
      if false#charge_user
        redirect_to root_url, notice: "Thank you for placing the order"
      else
        flash[:warning] = <<EOF
We have stored your order with the id #{@order_form.order.id}.
You should receive an email with the order details and password change.<br/>
However, something went wrong with your credit card, please add another credit card.
EOF
        redirect_to new_payment_order_path(@order_form.order)
      end
    else
      render "carts/checkout"
    end
  end

  def new_payment
    @order = Order.find(params[:id])
    @client_token = Braintree::ClientToken.generate
  end

  def pay
    @order = Order.find(params[:id])
    transaction = OrderTransaction.new(@order, params[:payment_method_nonce])
    transaction.execute
    if transaction.ok?
      redirect_to root_url, notice: "Thank you for placing the order"
    else
      render 'orders/new_payment'
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

  def charge_user
    transaction = Ordertransaction.new(@order, params[:payment_method_nonce])
    transaction.execute
    transaction.ok?
  end
end
