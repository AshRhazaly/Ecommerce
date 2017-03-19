class AddQuantityToShoppingCartItems < ActiveRecord::Migration[5.0]
  def change
    add_column :shopping_cart_items, :quantity, :integer
  end
end
