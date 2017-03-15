class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.references :cart, foreign_key: true
      t.text :address
      t.string :contact

      t.timestamps
    end
  end
end
