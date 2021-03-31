class CreateCoffeeBreaks < ActiveRecord::Migration[6.1]
  def change
    create_table :coffee_breaks do |t|
      t.references :user_1, null: false
      t.references :user_2, null: false

      t.timestamps
    end
  end
end
