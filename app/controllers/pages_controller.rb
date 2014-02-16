class PagesController < ApplicationController

  def index
    @adventure = Adventure.find(params[:adventure_id])
    @pages = @adventure.pages
  end

  def new
    @adventure = Adventure.find(params[:adventure_id])
    @page = Page.new

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
    # @first_page = @adventure.pages.find_by_name("start")
    # binding.pry
    @page = @adventure.pages.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
   


end