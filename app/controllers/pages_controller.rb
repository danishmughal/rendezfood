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
  
=begin
  def search
      if request.post?
          pollid = [params[:pollid]]
          tag_name = [params[:tag]]

          tag = Tag.new
          tag.name = tag_name
          tag.save

          poll = Poll.where(:id = pollid)
          poll.tags << tag
          poll.save
      end
  end
=end

end
