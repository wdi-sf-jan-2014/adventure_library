class PagesController < ApplicationController


  def show
    adventure_id = params[:adventure_id]
    adventure = Adventure.find(adventure_id)
    page_id = params[:id]
    pages = adventure.pages
    @page = pages.find(page_id)
  end
end
