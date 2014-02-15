class AdventuresController < ApplicationController
	def new
		@aventure = Adventure.new
	end
	def create
	  	adventure = Adventure.create(params[:adventure].permit(:name,:author))
	  	adventure["guid"] = SecureRandom.urlsafe_base64(10)
	  	adventure.save
	  	redirect_to adventure_path(adventure)
     end
     def index
  	    @adventures = Adventure.all
     end
end
