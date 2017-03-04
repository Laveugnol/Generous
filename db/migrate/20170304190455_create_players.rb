class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :nom
      t.string :ville
      t.string :photo
      t.integer :gift

      t.timestamps
    end
  end
end
