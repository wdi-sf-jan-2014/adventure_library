class PagesController < ApplicationController
  def index
    @adventures = Adventure.all

  end

  def new
    @adventure = Adventure.find(params[:adventure_id])
    @page = @adventure.pages.new
  end

  def create 
    # raise params.inspect
    @adventure = Adventure.find(params[:adventure_id])
    page = @adventure.pages.create(params.require(:page).permit(:name, :text))
    if page.save
      redirect_to new_adventure_page_path(@adventure.id)
    else 
      render :new
    end
  end

  def show
    @adventure = Adventure.find(params[:adventure_id])
    @page = @adventure.pages.find(params[:id])
  end

  def edit
    @adventure = Adventure.find(params[:adventure_id])
    @page = @adventure.pages.find(params[:id])
  end
end
