require 'rails_helper'


describe ProductsController do
  it "Creates a product" do
    params = {
      product: {
      name: "Jackfruit",
        price: 5.55,
        description: 'Tasty fruit',
        inventory: 5,
      }
    }
    should permit(:name, :price, :description, :inventory).
      for(:create, params: params).
      on(:product)
  end
end
