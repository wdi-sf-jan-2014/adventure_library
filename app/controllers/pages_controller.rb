class PagesController < ApplicationController
  def show
  end

  def new
    id = params[:adventure_id]
    find_page = Adventure.find(id)
    @adventure = find_page
  end

  def create
    id = params[:adventure_id]
    @adventure = Adventure.find(id)
    new_page = params.require(:page).permit(:name, :text)
    @adventure.pages.create(new_page)
    redirect_to new_adventure_page_path(@adventure)
  end
end
