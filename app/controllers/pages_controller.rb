class PagesController < ApplicationController

  def new
    @adventure = Adventure.find(params[:adventure_id])
    @page = Page.new()
  end

  def create
    adventure = Adventure.find(params[:adventure_id])
    new_page = Page.create(params.require(:page).permit(:name, :text))
    adventure.pages << new_page 
    flash[:success] = "Page '#{new_page.name}' successfully added to #{adventure.title}!"
    redirect_to adventures_path
  end

  def show
    @adventure = Adventure.find(params[:adventure_id])
    @page = @adventure.pages.find(params[:id])
  end

  def edit
    @adventure = Adventure.find(params[:adventure_id])
    @page = Page.find(params[:id])
  end

  def update
    adventure = Adventure.find(params[:adventure_id])
    page = Page.find(params[:id])
    page.update_attributes(params.require(:page).permit(:name, :text))
    redirect_to adventure_page_path(adventure.id, page.id)
  end

end
