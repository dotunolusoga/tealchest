class OrderTransaction

  def initialize order, nonce
    @order = order
    @nonce = nonce
  end

  def execute
    Braintree::Transaction.sale(
      amount: order.total_price,
      payment_method_nonce: nonce
    )
  end

  def ok?
  end

  private

  attr_reader :order, :nonce

end
