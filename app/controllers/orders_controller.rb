class OrdersController < ApplicationController
  def create

  # order  = Order.create!(player_sku: params[:order][:player_sku], amount: params[:order][:amount_cents].to_i, state: 'pending', email:params[:order][:eamil])
  @order  = Order.new(order_params)
  @order.state = "pending"


  if @order.save
      redirect_to new_order_payment_path(@order)
    else
      flash[:error] = "L'ensemble des champs doivent être renseignés (chiffres ronds et positifs)"
      redirect_to root_path

    end

  end

private

  def order_params
    params.require(:order).permit(:player_sku, :amount, :email, :photo, :amount_cents, :photo_cache)
  end
end
