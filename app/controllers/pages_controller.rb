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

    def add_tag
        if request.post?
            pollid = [params[:pollid]]
            tag_name = [params[:tag]]

            tag = Tag.find(:tag_name = tag_name)
            if tag
                render :nothing => true, :status => 'failed'
                return
            end
            tag = Tag.new
            tag.tag_name = tag_name
            tag.save

            poll = Poll.find(:id = pollid)
            poll.tags << tag
            poll.save
            render :nothing => true, :status => 'success'
        end
    end

    def search
        if request.post?
            keyword = [params["tag"]]

end
