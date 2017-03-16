class Product < ApplicationRecord
  validates :name,:description,:price,:inventory, presence: true
  has_one :line_item

  # def update_inventory
  #   self.inventory - self.line_item.quantity
  #   self.save
  # end
end
