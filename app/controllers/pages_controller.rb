class PagesController < ApplicationController


  def index
    adventure = Adventure.find(params[:adventure_id])
    @pages = adventure.pages.all
  end

  def show
    @page = Page.find(params[:id])

  end

  def new
    @page = Page.new
  end

  def create
    page_params = params.require(:page).permit(:name, :text)
    #how do i get the adventure_id?
    adventure = Adventure.find(params[:adventure_id])
    @page = adventure.pages.create(page_params)
    redirect_to adventure_page_path(adventure)
  end

  def edit
  end

  def update
  end


end
