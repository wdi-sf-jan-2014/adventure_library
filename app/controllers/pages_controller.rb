class PagesController < ApplicationController
  def index
  end

  def show
    @adventure = Adventure.find(params[:adventure_id])
    @page = @adventure.pages.find_by(params[name: "start"])
  end

  def new
    @adventure = Adventure.find(params[:adventure_id])
    @page = @adventure.pages.build
  end

  def create
    @adventure = Adventure.find(params[:adventure_id])
    page = @adventure.pages.build(params.require(:page).permit(:name, :text))
    if page.save
      redirect_to adventure_path(@adventure.id)
    else
      render :new
    end
  end

  def destroy
  end

  def edit
  end

  def update
  end
end

