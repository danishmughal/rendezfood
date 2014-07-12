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
          pollid = [params[:pollid]]
          tag = [params[:tag]]
          
      end
  end

end
