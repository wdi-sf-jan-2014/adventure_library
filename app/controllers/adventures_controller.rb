
class AdventuresController < ApplicationController

    def index
      @libraries = Library.all
      @adventures = Adventure.all
      @my_adventures = Adventure.where(library_id: nil)
      @friends_adventures = Adventure.where("library_id IS NOT NULL")
      respond_to do |format|
        format.html
        format.json {render json: @my_adventures}
      end
    end



    def create
      new_adventure= params.require(:adventure).permit(:title, :author)
      new_adventure = Adventure.create(new_adventure)
      new_adventure.guid = SecureRandom.urlsafe_base64(10)
      new_adventure.save
      @adventure = new_adventure
      redirect_to new_adventure_page_path(@adventure.id)
    end

   def new
    @adventure = Adventure.new
   end

end
