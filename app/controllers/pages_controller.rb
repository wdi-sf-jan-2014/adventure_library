class PagesController < ApplicationController

  def index
    @local_adventure = Adventure.find(params[:id])
  end 

  def new 
    @local_adventure = Adventure.find(params[:adventure_id])
    @page = @local_adventure.pages.build 
  end 

  def create 
    @local_adventure = Adventure.find(params[:adventure_id])
    new_page = params.require(:page).permit(:name, :text)
    @local_adventure.pages.create(new_page)
    if new_page["name"] == "end"
      redirect_to adventure_path(@local_adventure.id)
    else
      redirect_to new_adventure_page_path(@local_adventure)
    end 
  end 

  def show 
    @local_adventure = Adventure.find(params[:adventure_id])
    @page = @local_adventure.pages.find_by(params[name: "start"])
  end 

end 

 
