# == Schema Information
#
# Table name: polls
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  title       :string(255)
#  description :string(255)
#  food_time   :datetime
#  active      :boolean
#  address     :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Poll < ActiveRecord::Base

	belongs_to :user
	has_many :poll_items
	has_many :poll_users
    has_many :tags

end
