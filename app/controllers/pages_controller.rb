class PagesController < ApplicationController

  def index
    @adventure = Adventure.find(params[:adventure_id]) 
  end

  def new
    @adventure = Adventure.find(params[:adventure_id])
    @page = @adventure.pages.build
  end

  def create
    adventure = Adventure.find(params[:adventure_id])
    new_page = params.require(:page).permit(:name, :text)
    page = adventure.pages.create!(new_page)
    redirect_to new_adventure_page_path(adventure.id)
  end  

  def show
    @adventure = Adventure.find(params[:adventure_id])
    @page = @adventure.pages.find(params[:id])
  end

  def edit
    @adventure = Adventure.find(params[:adventure_id])
    @page = @adventure.pages.find(params[:id])
  end

  def update
    adventure = Adventure.find(params[:adventure_id])
    update_page = params.require(:page).permit(:name, :text)
    adventure.pages.find(params[:id]).update_attributes(update_page)
    redirect_to edit_adventure_path(adventure)
  end


end
