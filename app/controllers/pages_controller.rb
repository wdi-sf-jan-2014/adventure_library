class PagesController < ApplicationController

  def index
    @adventure = Adventure.find(params[:adventure_id])
    @pages = @adventure.pages
  end

  def new
    @adventure = Adventure.find(params[:adventure_id])
    @page = Page.new

  end

  def create
    page = params.require(:page).permit(:name, :text)
    @adventure = Adventure.find(params[:adventure_id])
    @page = @adventure.pages.create(page)
    redirect_to [@adventure, @page]
  end

  def show
    @adventure = Adventure.find(params[:adventure_id])
    @page = @adventure.pages.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
   


end