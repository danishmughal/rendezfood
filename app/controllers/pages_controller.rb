class PagesController < ApplicationController


	def home
		if !user_signed_in?
			redirect_to '/splash'
		end
	end

	def index
	end

	def splash
	end

	def restaurant
	end

end