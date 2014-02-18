class PagesController < ApplicationController
  def index
    @pages = Adventure.find(params[:adventure_id]).pages
  end

  def show
    @page = Page.find(params[:id])
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    updated_info = params.require(:page).permit(:name, :text)
    @page = Page.find(params[:id])
    @page.update_attributes(updated_info)
    redirect_to adventure_pages_path
  end

  def new
    @page = Page.new
  end

  def create
    adventure_id = params[:adventure_id]
    page_params = params.require(:page).permit(:name, :text)
    page = Page.create(page_params)
    page.adventure = Adventure.find(adventure_id)
    page.save
    redirect_to adventure_pages_path
  end

end
