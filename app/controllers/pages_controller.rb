class PagesController < ApplicationController


  def index
    adventure = Adventure.find(params[:adventure_id])
    @pages = adventure.pages.all

    binding.pry
    #to grab random pictures
    gon.picture = adventure.name
  end

  def show
    @page = Page.find(params[:id])
    #to grab random pictures
    gon.picture = @page.name

  end

  def new
    @adventure = Adventure.find(params[:adventure_id])
    @page = Page.new
  end

  def create
    page_params = params.require(:page).permit(:name, :text)
    #how do i get the adventure_id?
    adventure = Adventure.find(params[:adventure_id])
    @page = adventure.pages.create(page_params)
    redirect_to new_adventure_page_path(adventure, @page)
  end

  def edit
  end

  def update
  end


end
