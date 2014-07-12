class CreatePollVotes < ActiveRecord::Migration
  def change
    create_table :poll_votes do |t|

    	t.belongs_to :user
    	t.belongs_to :poll_item

      t.timestamps
    end
  end
end
