# == Schema Information
#
# Table name: restaurants
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  image      :string(255)
#  address    :string(255)
#  city       :string(255)
#  state      :string(255)
#  category   :string(255)
#  rating     :decimal(, )
#  created_at :datetime
#  updated_at :datetime
#

class Restaurant < ActiveRecord::Base

	belongs_to :poll_item

end
