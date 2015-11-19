class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  def total_price
    quantity * product.price_cents
  end
end
