class PagesController < ApplicationController
  def home
    @player = Player.new
    @order = Order.new
    @challengers = Order.all.where(state: 'paid')
    @classement = @challengers.sort_by { |x| x.amount_cents}.reverse
    @winner = @classement[0]
    @second = @classement[1]
    @third = @classement[2]


    @user = User.new

  end
end
