class PagesController < ApplicationController
  def index
  end

  def create
  new_page_params = params.require(:page).permit(:name, :text)
  adventure = Adventure.find(params[:adventure_id])
  adventure.pages.create(new_page_params)
  redirect_to "/adventures/#{adventure.id}/pages/new"
  end

  def new
  @adventure = Adventure.find(params[:adventure_id]) 
  @page = @adventure.pages.new
  end

  def update
  @adventure = Adventure.find(params[:id])   
  @adventure.update_attributes(params[:adventure].permit(:title, :author, :guid, :pages_attributes =>[:name, :text]))
  redirect_to "/adventures/#{@adventure.id}/pages/new"
  end

  def show
  @adventure = Adventure.find(params[:adventure_id]) 
  @page = @adventure.pages.find(params[:id])
  end

  def edit
  @adventure = Adventure.find(params[:id])
  end 

  def update
  end

  def destroy
  end
end
