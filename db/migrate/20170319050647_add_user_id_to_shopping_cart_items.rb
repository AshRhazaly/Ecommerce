class AddUserIdToShoppingCartItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :shopping_cart_items, :user, foreign_key: true
  end
end
