class PagesController < ApplicationController
  def index
    @adventure = Adventure.find(params[:id])

  end

  def new
    @adventure = Adventure.find(params[:adventure_id])
  end

  def create
    @adventure = Adventure.find(params[:adventure_id])
    new_page = params.require(:page).permit(:name, :text)
    @adventure.pages.create(new_page)
    if new_page["name"] == "end"
      redirect_to adventure_path(@adventure.id)
    else
      redirect_to new_adventure_page_path(@adventure)
    end
  end

  def edit
  end

  def show
    @adventure = Adventure.find(params[:adventure_id])
    @page = Page.find(params[:id])
  end
end
