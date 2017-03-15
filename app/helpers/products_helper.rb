module ProductsHelper

  def discounted_price(user_signed_in, price)
    user_signed_in? ? price * 0.85 : price
  end

end
