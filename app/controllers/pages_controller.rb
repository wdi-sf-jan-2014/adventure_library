class PagesController < ApplicationController

  def new 
    @adventure = Adventure.find(params[:adventure_id])
    @page = @adventure.pages.build 
  end 

  def create 
    adventure = Adventure.find(params[:adventure_id])
    new_page = params.require(:page).permit(:name, :text)
    adventure = adventure.pages.create(new_page)
    
  end 

end
