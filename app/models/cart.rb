class Cart < ApplicationRecord
  belongs_to :user
  has_one :payment
  has_many :line_items
  has_many :products, through: :line_items

  def total_price
    total_price = 0
    self.line_items.each do |qty|
      total_price += qty.subtotal
    end
    total_price
  end

  def transaction(stripeToken)
    begin
      Stripe::Charge.create(
        amount: self.total_price*100,
        currency: "usd",
        source: stripeToken
        )
      self.save
    rescue
      puts "transaction fails"
    end

  end


  def stack_item(product, params)
    self.item_already_exists?(product) ? increase_quantity(params) : add_item(product, params)
    @line_item.save
  end

  def increase_quantity(params)
    @line_item.quantity += params[:line_item][:quantity].to_i
  end

  def add_item(product, params)
    @line_item = LineItem.new(product: product, quantity: params[:line_item][:quantity])
    @line_item.cart = self
  end

  def item_already_exists?(product)
    @line_item = self.line_items.find_by(product: product)
  end

  def self.find_or_create(cart_id, current_user)
    if cart_id == nil
      cart = Cart.create(user: current_user)
      cart_id = cart.id
    else
      cart = Cart.find(cart_id)
    end
    return cart
  end
end
