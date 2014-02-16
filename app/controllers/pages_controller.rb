class PagesController < ApplicationController
  def new
  end

  def show
    @adventure = Adventure.find(params[:adventure_id])
    @pages = @adventure.pages.find(params[:id])

  end

  def create
  end
end
