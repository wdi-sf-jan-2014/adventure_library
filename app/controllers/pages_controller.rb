class PagesController < ApplicationController

  def new
    @adventure = Adventure.find(params[:adventure_id])
    @page = @adventue.pages.build
  end

  def show
    @adventure = Adventure.find(params[:id])
    @page = @adventure.pages.find(params[:id])
  end

  def index
    @adventure = Adventure.find(params[:adventure_id])
  end

  def edit
    @adventure = Adventure.find(params[:auction_id])
    @page = @adventure.pages.find(params[:id])
  end

  def update
    updated_page = params.require[:page].permit(:name, :text)
    adventure = Adventure.find(params[:adventure_id])
    page = adventure.pages.find(params[:id])
    page.update_attributes(updated_page)

    redirect_to adventure_pages_route
  end

  def create
    new_page = params.require(:page).permit(:name, :text)
    adventure = Adventure.find(params[:adventure_id])
    page = adventure.pages.create(new_page)

    redirect_to adventure_pages_route(adventure, page)
  end

  def delete
    Page.find(params[:id]).destroy
    redirect_to :index
  end

end
