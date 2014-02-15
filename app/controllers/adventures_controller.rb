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
  	    respond_to do |f|
		    f.html 
		    f.json { render :json => @adventures}
         end
     end
     def show
  	     @adventure = Adventure.find(params[:id])
  	     @pages = @adventure.pages
  	     respond_to do |f|
		    f.html 
		    f.json { render :json => @adventure.to_json(:include => :pages)}
         end
     end
end
