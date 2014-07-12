# == Schema Information
#
# Table name: menus
#
#  id            :integer          not null, primary key
#  restaurant_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Menu < ActiveRecord::Base

	has_many :menu_items
	belongs_to :restaurant

end
