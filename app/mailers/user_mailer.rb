class UserMailer < ApplicationMailer
  default from: 'rubyonrailspractical@gmail.com'

  def top_selling_product(user)
    @user = user
    @payments = Payment.all
    @product_name = []
    @product_quantity = []
    @product_hash = {}
    @payments.each do |payment|
      payment.cart.line_items.each do |line_item|
        @product_name << line_item.product.name
        @product_quantity << line_item.quantity
      end
    end
    @product_hash = @product_name.zip(@product_quantity).group_by(&:first).map { |k, v| [k, v.map(&:last).inject(:+)] }.to_h
    @top_products = @product_hash.sort_by { |k,v| -v }.first(2).to_h.keys
    mail(to: @user.email , subject: 'Our best selling products in Fruit Ninja')
  end
end
