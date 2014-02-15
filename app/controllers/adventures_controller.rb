
class AdventuresController < ApplicationController

    def index
      @adventures = Adventure.all
      respond_to do |format|
        format.html
        format.json {render json: @adventures}
      end
    end

    def create
      new_adventure= params.require(:adventure).permit(:title, :author)
      new_adventure = Adventure.create(new_adventure)
      new_adventure.guid = SecureRandom.urlsafe_base64(10)
      @adventure = new_adventure
      redirect_to new_adventure_page_path(@adventure.id)
    end

   def new
    @adventure = Adventure.new
   end

end
