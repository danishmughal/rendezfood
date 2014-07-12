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

require 'test_helper'

class PollItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
