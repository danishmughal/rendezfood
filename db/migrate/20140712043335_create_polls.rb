class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|

    	t.belongs_to :user
    	t.string :title
    	t.string :description
    	t.datetime :food_time
    	t.boolean :active
      t.string :address

      t.timestamps
    end
  end
end