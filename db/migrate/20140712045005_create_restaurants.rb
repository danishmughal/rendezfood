class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|

      t.belongs_to :poll
      t.integer :votes

    	t.string :name
    	t.string :image
    	t.string :address
    	t.string :city
    	t.string :state
    	t.string :category
    	t.decimal :rating


      t.timestamps
    end
  end
end
