class CreateRestaurantVotes < ActiveRecord::Migration
  def change
    create_table :restaurant_votes do |t|

    	t.belongs_to :user
    	t.belongs_to :restaurant

      t.timestamps
    end
  end
end
