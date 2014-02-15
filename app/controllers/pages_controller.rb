class PagesController < ApplicationController

  def new 
    @local_adventure = Adventure.find(params[:adventure_id])
    @page = @local_adventure.pages.build 
  end 

  def create 
    @local_adventure = Adventure.find(params[:adventure_id])
    new_page = @local_adventure.pages.create(params.require(:page).permit(:name, :text))
    if new_page.save 
      redirect_to new_adventure_page_path(@local_adventure.id)
    else 
      render :new
    end 
  end 

  def show 

  end 

  end 

  