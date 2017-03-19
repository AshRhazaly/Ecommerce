class LineItemsController < ApplicationController
  before_action :set_lineitems, only: [:create,:destroy,:update]

  def create
    @cart = Cart.find_or_create(session[:cart_id], current_user)
    session[:cart_id] = @cart.id
    @cart.stack_item(@product, params)
    flash[:notice] = "Product added to cart"
    @product.decrement!(:inventory, params[:line_item][:quantity].to_i)
    redirect_to @product
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
  end

  def update
  end

  private
  def set_lineitems
    @product = Product.find(params[:product_id])
  end

end
