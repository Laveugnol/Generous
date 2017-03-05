class OrdersController < ApplicationController
  def create

  # order  = Order.create!(player_sku: params[:order][:player_sku], amount: params[:order][:amount_cents].to_i, state: 'pending', email:params[:order][:eamil])
  order  = Order.create!(order_params)
  order.state = "pending"
  order.save
  redirect_to new_order_payment_path(order)

  end

private

  def order_params
    params.require(:order).permit(:player_sku, :amount, :email, :photo, :amount_cents, :photo_cache)
  end
end
