class PagesController < ApplicationController

  def index
    @pages = Page.all 
  end

  def new
    @page = Page.new
  end

  def show
    @page = Page.find(params[:id])
  end

  def create
    page = params.require(:adventrue).permit(:name, :text)
    @page = Page.create!(page)

  end
end
