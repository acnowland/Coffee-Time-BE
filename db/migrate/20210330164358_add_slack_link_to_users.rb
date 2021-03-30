class AddSlackLinkToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :slackLink, :string
  end
end
