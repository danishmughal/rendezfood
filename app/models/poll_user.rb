# == Schema Information
#
# Table name: poll_users
#
#  id         :integer          not null, primary key
#  poll_id    :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class PollUser < ActiveRecord::Base

	belongs_to :poll
	belongs_to :user

end
