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
    page = @adventure.pages.create()
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

  def update
    @adventure = Adventure.find(params[:adventure_id])
    @adventure.pages.find(params[:id]).update_attributes(page_params)
    redirect_to edit_adventure_path(@adventure)
  end

private
  def page_params
    params.require(:page).permit(:name, :text)
  end
end
