class AddModToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :mod, :integer
  end
end
