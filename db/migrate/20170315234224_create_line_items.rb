class CreateLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :line_items do |t|
      t.integer :quantity
      t.string :product_id
      t.string :cart_id

      t.timestamps
    end

    add_index :line_items, :product_id
    add_index :line_items, :cart_id
  end
end
