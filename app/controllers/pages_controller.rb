class PagesController < ApplicationController

  def show
  		@adventure = Adventure.find(params[:adventure_id])
  		@page = @adventure.pages.find(params[:id])
  end

  def new
      @page = Page.new	
  end

  def create
  	page = Page.create(params[:page].permit(:name,:text))
	redirect_to pages_path(page)
  end

end
