require 'rails_helper'

RSpec.describe Product, type: :controller do

  describe "Create Product" do
    it do
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

end
