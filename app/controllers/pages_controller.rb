class PagesController < ApplicationController
  def index
  end

  def new
  end

  def create 
    adventure = Adventure.find(params[:adventure_id])
    page = adventure.pages.create(params.require(:page).permit(:name, :text))
  end

  def show
  end

  def edit
  end
end
