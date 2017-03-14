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

  it "assigns a new search to @search" do
    assign(:search, MetaSearchTestHelper.new(:product=>"Product"))
    assign(:products, [product(Product)]
    render
    rendered.should contain("Search")
  end

end
