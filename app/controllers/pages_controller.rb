class PagesController < ApplicationController
  def index
  end

  def create
  new_page = params.require(:page).permit(:name, :text)
  adventure = Adventure.find(params[:id])  
  page =  adventure.pages.create(new_page)
  redirect_to comment_path(page)
  end

  def new
  @adventure = Adventure.find(params[:adventure_id])
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end
end
