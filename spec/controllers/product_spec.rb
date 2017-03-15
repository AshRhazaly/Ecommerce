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

  describe '#search' do
    it 'should return results' do
      get :search, "search" => { "name" => "apple", "description" => "lorem" }
      response.should be_ok

      should render_with_layout('search')
    end
  end

  describe 'GET #show' do
    before { get :show }

    it { should render_template('show') }
  end

  describe 'GET #new' do
    before { get :new}

    it {should render_template('new')}
  end


  describe "delete #destroy" do
    let(:valid_params)  {FactoryGirl.create :product} 

    it 'deletes a fucking Product' do
      expect {
        product :delete, valid_params
      }.to change(Product, :count).by(-1)
    end
  end

  describe 'Update' do
    before do
      create(:product, id: 1)
    end

    it 'able to update params' do
      params = {
        id: 1,
        product: {
            name: 'huckleberry',
            price: 5.55,
            description: 'jolly old good fruit',
            inventory: 5
        }
      }
      should permit(:name, :price, :description, :inventory).
        for(:update, params: params).
        on(:product)
    end
  end
end
