class AdventuresController < ApplicationController


  def index
    @adventures = Adventure.all
  end

  def show
    adventure = Adventure.find(params[:id])
    start_page = adventure.pages.where(:name => "start")
    redirect_to adventure_page_path(adventure, start_page.first.id)

  end

  def new
    @adventure = Adventure.new
  end

  def create
    adventure_params = params.require(:adventure).permit(:title, :author, pages_attributes: [:name, :text])
    adventure = Adventure.create(adventure_params)
    adventure.guid = SecureRandom.urlsafe_base64(10)
    adventure.save
    redirect_to adventure_path(adventure)
  end

  def edit
  end

  def update
  end


end
