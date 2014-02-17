
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
      new_adventure= params.require(:adventure).permit(:title, :author,:guid,:pages_attributes =>[:name, :text])
      new_adventure = Adventure.create(new_adventure)
      new_adventure.save
      @adventure = new_adventure
      redirect_to new_adventure_page_path(@adventure.id)
    end

   def new
    @adventure = Adventure.new
    2.times { @adventure.pages.build }
   end


  def destroy
   adventure = Adventure.find(params[:id])
   adventure.destroy
   redirect_to adventures_path
  end

  def update
    @adventure = Adventure.find(params[:id])
    @adventure.update_attributes(params.require(:adventure).permit(:title, :author, pages_attributes: [ :name, :text ]))
    redirect_to adventure_path
  end

  def edit
    @adventure = Adventure.find(params[:id])
    @first_page = @adventure.pages.find_by(name: "start")
    
  end

end
