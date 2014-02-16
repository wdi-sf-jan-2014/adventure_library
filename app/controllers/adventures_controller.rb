class AdventuresController < ApplicationController
  def index
    @adventures = Adventure.all
  end

  def show
    @page = Adventure.find(params[:id]).pages.find_by(:name => "start")
  end

  def new
    @adventure = Adventure.new
  end

  def create
    adventure_params = params.require(:adventure).permit(:title, :author)
    adventure = Adventure.create(adventure_params)
    redirect_to '#{adventure_path(adventure.id)}/pages'
  end
end
