module ProductsHelper

  def discounted_price(user_signed_in, price)
    user_signed_in? ? price * ENV["discounted_price"].to_f : price
  end

end
