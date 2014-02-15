class PagesController < ApplicationController
  include PagesHelper

  def new
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

end