class AdventuresController < ApplicationController

  def index 
    @local_adventures = Adventure.all

  end 

  def new 
    @local_adventure = Adventure.new
    # @pages = @local_adventure.pages
  end 

  def show 
    @local_adventure = Adventure.find(params[:id])
    @pages = @adventure.pages.find(params[:id])
  end 

  def create 
    new_adventure = params.require(:adventure).permit(:title, :author, :pages_attributes => [:name, :text])
    new_adventure["guid"] = SecureRandom.urlsafe_base64(10)
    new_adventure.save
    @local_adventure = Adventure.create(new_adventure)
    redirect_to new_adventure_page_path(@local_adventure, @page)
  end 

end



