class RestaurantsController < ApplicationController

	def show
		@restaurant = Restaurant.find(params[:id])
	end

	def vote
		restaurantvote = RestaurantVote.new(restaurant_id: params[:restaurant_id], user_id: current_user.id)
		restaurantvote.save!
		restaurant = Restaurant.find(params[:restaurant_id])
		restaurant.votes += 1
		restaurant.save
		redirect_to "/"
	end

end
