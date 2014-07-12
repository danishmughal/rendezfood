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

require 'test_helper'

class PollUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
