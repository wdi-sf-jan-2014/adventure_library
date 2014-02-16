class PagesController < ApplicationController
  
  def index
  @adventure = Adventure.find(params[:adventure_id]) 
  end

  def new
  @adventure = Adventure.find(params[:adventure_id]) 
  @page = @adventure.pages.new
  end

  def create
  new_page_params = params.require(:page).permit(:name, :text)
  adventure = Adventure.find(params[:adventure_id])
  adventure.pages.create(new_page_params)
  redirect_to "/adventures/#{adventure.id}/pages/new"
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
  adventure = Adventure.find(params[:adventure_id])
  page = adventure.pages.find(params[:id])
  edited_params = params.require(:page).permit(:name, :text)  
  page.update_attributes(edited_params)
  redirect_to "/adventures/#{adventure.id}/pages/new"
  end

  def destroy
  adventure = Adventure.find(params[:adventure_id])
  page = adventure.pages.find(params[:id])
  page.destroy
  redirect_to "/adventures/#{adventure.id}/pages/new"
  end

end
