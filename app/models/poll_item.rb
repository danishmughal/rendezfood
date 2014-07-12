# == Schema Information
#
# Table name: poll_items
#
#  id            :integer          not null, primary key
#  poll_id       :integer
#  restaurant_id :integer
#  votes         :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class PollItem < ActiveRecord::Base

	belongs_to :poll
	has_one :restaurant
	has_many :poll_votes
    has_many :tags

end
