class UserMailer < ApplicationMailer
  default from: 'rubyonrailspractical@gmail.com'

  def top_selling_product(user)
    @user = user
    payments = Payment.all
    product_name = []
    product_quantity = []
    product_hash = {}
    payments.each do |payment|
    payment.cart.line_items.each do |line_item|
      product_name << line_item.product.name
      product_quantity << line_item.quantity
    end
    product_name.zip(product_quantity).group_by(&:first).map { |k, v| [k, v.map(&:last).inject(:+)] }.to_h
    max_quantity = product_hash.values.max
    @max_products = product_hash.select {|key,value| value == max_quantity}.keys
    # if there's a tie there'll be 2 values in max_products
    
  end
end
