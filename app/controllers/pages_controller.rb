class PagesController < ApplicationController
  def new
    @page = Page.new
  end

  def show
    @adventure = Adventure.find(params[:adventure_id])
    @page = @adventure.pages.find(params[:id])
  end

  def create
    @adventure = Adventure.find(params[:adventure_id])
    new_page = params.require(:page).permit(:text, :adventure_id)
    @page = @adventure.pages.create(new_page)
    redirect_to adventure_path(@adventure.id, @page.id)
  end
end
