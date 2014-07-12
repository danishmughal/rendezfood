class CreatePollUsers < ActiveRecord::Migration
  def change
    create_table :poll_users do |t|

    	t.belongs_to :poll
    	t.belongs_to :user

      t.timestamps
    end
  end
end
