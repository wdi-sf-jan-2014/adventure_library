class PagesController < ApplicationController


  def show
    @adventure = Adventure.find(params[:adventure_id])
    @pages = @adventure.pages.find(params[:id])

  end

end
