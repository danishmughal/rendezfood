# == Schema Information
#
# Table name: menuitems
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  price      :decimal(, )
#  created_at :datetime
#  updated_at :datetime
#

class Menuitem < ActiveRecord::Base

	belongs_to :menu

end
