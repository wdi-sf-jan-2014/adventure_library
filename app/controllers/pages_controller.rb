class PagesController < ApplicationController
  def index
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
  end

  def edit
  end
end
