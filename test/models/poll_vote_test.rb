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

require 'test_helper'

class PollVoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
