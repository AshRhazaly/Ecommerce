class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  def subtotal
    self.product.price * self.quantity
  end

  def inventory_update
    self.product.inventory - self.quantity
  end


end
