class PaymentsController < ApplicationController
    before_action :set_order

  def new
  end

  def create
  customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
  )

  charge = Stripe::Charge.create(
    customer:     customer.id,   # You should store this customer id and re-use it.
    amount:       @order.amount_cents*100, # or amount_pennies
    description:  "Show-off gift from #{@order.player_sku} ",
    currency:     @order.amount.currency
  )

  @order.update(payment: charge.to_json, state: 'paid')
  flash[:notice] = "Yiihaaa, let's discover if you get the first place"
  redirect_to root_path

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_order_payment_path(@order)
end

private

  def set_order
    @order = Order.where(state: 'pending').find(params[:order_id])
  end
end
