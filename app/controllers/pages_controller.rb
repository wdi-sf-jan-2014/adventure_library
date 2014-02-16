class PagesController < ApplicationController
  def show
    id = params[:adventure_id]
    find_page = Adventure.find(id)

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
    if new_page["name"] == "end"
      redirect_to adventure_path(@adventure)
    else
    redirect_to new_adventure_page_path(@adventure)
  end
  end
end
