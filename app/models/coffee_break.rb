class CoffeeBreak < ApplicationRecord
  belongs_to :user_1, class_name: "User"
  belongs_to :user_2, class_name: "User"

  def self.create_mutual_coffee_break(user_1_id, user_2_id)
    CoffeeBreak.create(user_1_id: user_1_id, user_2_id: user_2_id)
    CoffeeBreak.create(user_1_id: user_2_id, user_2_id: user_1_id)
  end
end
