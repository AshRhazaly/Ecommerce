class Order < ApplicationRecord
  belongs_to :product

  def stripe_transcation(params, user_signed_in, price)
    stripe_token = params[:stripeToken]
    payment_type = params[:stripeTokenType]
    customer_email = params[:stripeEmail]
    amount = user_signed_in ? price * ENV["discounted_price"].to_f : price
    Stripe.api_key = Rails.configuration.stripe.secret_key
    Stripe::Charge.create(
    amount: (amount * 100).to_i,
    currency: "usd",
    source: stripe_token,
    receipt_email: customer_email
    )
  end
end
