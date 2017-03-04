class AddPriceToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_monetize :players, :price, currency: { present: false }
  end
end
