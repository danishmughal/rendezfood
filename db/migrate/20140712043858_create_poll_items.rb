class CreatePollItems < ActiveRecord::Migration
  def change
    create_table :poll_items do |t|

    	t.belongs_to :poll
    	t.belongs_to :restaurant
    	t.integer :votes

      t.timestamps
    end
  end
end
