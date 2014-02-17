class PagesController < ApplicationController

  def show
    @adventure = Adventure.find(params[:adventure_id])
    @page = @adventure.pages.find(params[:id])
  end

  def index
    @pages = Pages.all
  end
  
end
