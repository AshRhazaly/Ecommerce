class Payment < ApplicationRecord
  belongs_to :cart
  def transaction(stripeToken, user_signed_in)
    amount = 0
    user_signed_in ? amount = self.cart.total_price.to_i * 85 : amount = self.cart.total_price.to_i * 100
    begin
      Stripe::Charge.create(
        amount: amount,
        currency: "sgd",
        source: stripeToken
      )
      self.save
    rescue
      puts "Transaction Fail"
    end
  end
end
