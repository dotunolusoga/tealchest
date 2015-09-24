require 'rails_helper'

RSpec.describe Cart do

  scenario 'tests add one item' do
    cart = Cart.new
    cart.add_item 1

    expect(cart.empty?).to eq(false)
  end

  scenario 'tests adds up in quantity' do
    cart = Cart.new
    3.times { cart.add_item 1 }

    expect(1).to eq(cart.items.length)
    expect(3).to eq(cart.items.first.quantity)
  end

  scenario 'tests retrieves products' do
    product = Product.create! name: "Ankara", price_cents: 1, description: "Fabric", color: "grey", amount_available: 5

    cart = Cart.new
    cart.add_item product.id

    expect(cart.items.first.product).to be_kind_of(Product)
  end

  scenario 'tests serializes to hash' do
    cart = Cart.new
    cart.add_item 1

    expect(session_hash["cart"]).to eq(cart.serialize)
  end

  scenario 'test builds from hash' do
    cart = Cart.build_from_hash session_hash

    expect(cart.items.first.product_id).to eq(1)
  end

  private

  def session_hash
    {
      "cart" => {
        "items" => [
          { "product_id" => 1, "quantity" => 1 }
        ]
      }
    }
  end
end
