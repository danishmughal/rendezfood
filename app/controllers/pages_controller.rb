require 'net/http'

class PagesController < ApplicationController


	def home
		if !user_signed_in?
			redirect_to '/splash'
		end
	end

	def splash
	end

	def restaurant
	end

    def search
        if request.post?
            pollid = params[:pollid]
            tag_name = params[:tag]
=begin
            tag = Tag.where(tag_name: tag_name)
            if tag.nil?
                respond_to do |format|
                    format.json { render :json => {:status => 'false'}.to_json }
                end
                return
            end
=end
            tag = Tag.new
            tag.tag_name = tag_name
            tag.save!

            poll = Poll.find(pollid)
            poll.tags << tag
            poll.save!

            client = Yelp::Client.new
            
            #include Yelp::V2::Search::Request 

            request = Yelp::V2::Search::Request::Location.new(
                        :term => tag.tag_name,
                        :address => 'San Francisco',
                        :sort => 2,
                        :limit => 1)

            response = client.search(request)
            puts JSON.parse(response.to_json)['businesses']
            biz_info = JSON.parse(response.to_json)['businesses'][0]

            restaurant = Restaurant.new
            restaurant.name = biz_info['name']
            restaurant.image = biz_info['image_url']
            restaurant.rating = biz_info['avg_rating']
            restaurant.address = biz_info['address']
            restaurant.city = biz_info['city']
            restaurant.state = biz_info['state']
            restaurant.category = biz_info['categories'][0][0]
            restaurant.save
            
            html = '<li class="table-view-cell media"><a class="navigate-right" href="restaurant.html" data-transition="slide-in"><span class="badge">#</span><img height="50" width="50" class="media-object pull-left" src="restaurant_image"><div class="media-body">restaurant_name<p>restaurant_category</p></div></a></li>'

            html.sub! 'restaurant_image', restaurant.image
            html.sub! 'restaurant_name', restaurant.name
            html.sub! 'restaurant_category', restaurant.category

            respond_to do |format|
                format.json { render :json => {:status => 'true',
                                                :html => html}.to_json }
            end

=begin
            search_uri = 'http://api.locu.com/v1_0/venue/search/?api_key=ac6c8128fa9f47c81ed10e87f427f51f29c5c4de'

            search_uri << '&name=' << restaurant.name 
                        << '&has_menu=true'
                        << '&street_address=' << restaurant.address
                        << '&locality=' << restaurant.city
                        << '&region=' << restaurant.state

            res = Net::HTTP.get_response(URI.parse(URI.encode(search_uri)))
            if res.is_a?(Net::HTTPSuccess)
                json = JSON.parse(res.body)                
                id = json['objects'][0]['id']

            end

            venue_uri = 'http://api.locu.com/v1_0/venue/{venue_id}/?api_key=ac6c8128fa9f47c81ed10e87f427f51f29c5c4de'
 

=end
        end
    end    

end
