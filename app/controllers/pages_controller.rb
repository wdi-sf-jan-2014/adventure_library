class PagesController < ApplicationController
  def index
    @pages = Adventure.find(params[:adventure_id]).pages
  end

  def show
    @page = Page.find(params[:id])
  end

end
