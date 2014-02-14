class MyAdventuresController < ApplicationController
  def index
    @adventure = Adventure.all
  end

  def edit
  end

  def show
    @adventure = Adventure.find(params[:id])
  end

  def new
    @adventure = Adventure.new
  end

  def create
    adventure_params = params.require(:adventure).permit(:title, :author, :guid, :library_id)
    @adventure = Adventure.new(adventure_params)
  end

  def update

  end

  def destroy
    @adventure = Adventure.find)params[:id]
    @adventure.destroy
    redirect_to root_path
  end
end
