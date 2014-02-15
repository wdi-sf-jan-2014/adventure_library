class PagesController < ApplicationController
  def index
    @adventure = Adventure.find(params[:id])
    @pages = @adventure.pages
  end

  def show
    @adventure = Adventure.find(params[:adventure_id])
    @page = @adventure.pages.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @page }
    end
  end

  def update
  end

  def create
    @adventure = Adventure.find(params[:adventure_id])
    new_page = params.require(:adventure).permit(:title, :author, :pages_attributes =>[:name, :text])
    @page = @adventure.pages.create(new_page)
  end

  def new
    @adventure = Adventure.find(params[:adventure_id])
    @page = @adventure.pages.new
  end

  def destroy
  end

  def edit
  end
end
