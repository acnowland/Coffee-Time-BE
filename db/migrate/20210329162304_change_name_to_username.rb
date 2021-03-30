class ChangeNameToUsername < ActiveRecord::Migration[6.1]
  def change
    rename_column :Users, :name, :username
  end
end
