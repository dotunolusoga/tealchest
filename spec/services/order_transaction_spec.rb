require 'rails_helper'

RSpec.describe OrderTransaction do
  product = Fabricate(:product)

  scenario 'test creates a transaction' do
    order = Order.new
    order.order_items << OrderItem.new(product, quantity: 1)
    nonce = Braintree::Test::Nonce::Transactable
    transaction = OrderTransaction.new order, nonce

    transaction.execute
    expect(transaction.ok?).to eq(true), "Expected transaction to be successful."
  end
end
