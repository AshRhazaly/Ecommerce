class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  delegate :name, :price, :description, :inventory, :to => :product, :prefix => true

  def subtotal
    self.product.price * self.quantity
  end
end
