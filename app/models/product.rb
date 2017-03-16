class Product < ApplicationRecord
  validates :name,:description,:price,:inventory, presence: true
  has_one :line_item
  delegate :name, :price, :description, :inventory, :to => :product, :prefix => true

end
