class Product < ApplicationRecord
  validates :name,:description,:price,:inventory, presence: true
end
