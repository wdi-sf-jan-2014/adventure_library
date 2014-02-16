class PagesController < ApplicationController

  def index

  end

  def show
    @adventure = Adventure.find(params[:adventure_id])
    @page = @adventure.pages.find(params[:id])
  end
  
end
