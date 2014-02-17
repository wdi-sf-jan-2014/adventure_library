class PagesController < ApplicationController

  def new
    @adventure = Adventure.find(params[:adventure_id])
    @page = Page.new
  end

  def create
    new_page = params.require(:page).permit(:name, :text)
    adventure = Adventure.find(params[:adventure_id])
    page = adventure.pages.build(new_page)
    if page.save
      redirect_to adventure_path(adventure.id)
    else
      render :new
    end  
  end

  def show
    @page = Page.find(params[:id])
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    updated_page = params.require(:page).permit(:name, :text)
    page = Page.find(params[:id])
    page.update_attributes(updated_page) if page.adventure.is_local?
    redirect_to edit_adventure_path(page.adventure.id)
  end

  def destroy
    page = Page.find(params[:id])
    page.delete if page.adventure.is_local?
    redirect_to edit_adventure_path(page.adventure)
  end

end