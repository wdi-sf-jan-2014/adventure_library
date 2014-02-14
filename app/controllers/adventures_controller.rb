class AdventuresController < ApplicationController

  def index
    @adventures = Adventure.all
  end

  def new
    @adventure = Adventure.new
  end

  def create
    
    adventure = params.require(:adventure).permit(:title, :author)
    @adventure = Adventure.create(adventure)

    redirect_to adventures_path

  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end



end