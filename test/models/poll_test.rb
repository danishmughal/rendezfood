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

require 'test_helper'

class PollTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
