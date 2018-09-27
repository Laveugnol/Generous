class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :phone
      t.integer :policy

      t.timestamps
    end
  end
end
