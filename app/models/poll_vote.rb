# == Schema Information
#
# Table name: poll_votes
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  poll_item_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class PollVote < ActiveRecord::Base

	belongs_to :poll_item
	belongs_to :user

end