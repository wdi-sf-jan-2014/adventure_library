class AdventuresController < ApplicationController

  def index 
    @local_adventures = Adventure.all

  end 

  def new 
    @local_adventure = Adventure.new
  end 

  def show 
    @local_adventure = Adventure.find(params[:id])
    # @pages = @adventure.pages
    # @page = @adventure.pages.build 
  end 

  def create 
    new_adventure = params.require(:adventure).permit(:title, :author)
    adventure = Adventure.create(new_adventure)
    redirect_to new_adventure_pages
  end 

end
