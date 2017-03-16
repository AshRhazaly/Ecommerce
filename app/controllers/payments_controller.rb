class PaymentsController < ApplicationController
  def new
    @cart = Cart.find(session[:cart_id])
    @payment = Payment.new
  end

  def create
    @cart = Cart.find(session[:cart_id])
    @payment = @cart.build_payment(payment_params)
    @payment.transaction(params[:stripeToken], user_signed_in?)
    flash[:notice] = "THANKS FOR PAYING"
    @payment.save
    redirect_to products_path
  end

private
  def payment_params
    params.require(:payment).permit(:address, :contact)
  end
end
