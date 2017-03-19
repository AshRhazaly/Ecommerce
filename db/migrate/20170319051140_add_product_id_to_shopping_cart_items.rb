class AddProductIdToShoppingCartItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :shopping_cart_items, :product, foreign_key: true
  end
end
