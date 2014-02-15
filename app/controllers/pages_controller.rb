class PagesController < ApplicationController

  def index
    @pages = Page.all 
  end

  def new
    @adventure = Adventure.find(params[:adventure_id])
    @page = @adventure.pages.build
  end

  def show
    @adventure = Adventure.find(params[:adventure_id])
    @page = Page.find(params[:id])
  end

  def create
    adventure = Adventure.find(params[:adventure_id])
    new_page = params.require(:page).permit(:name, :text)
    page = Page.create!(new_page)
    redirect_to adventure_page_path(adventure, page)
  end
end
