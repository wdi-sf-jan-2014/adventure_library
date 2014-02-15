class AdventuresController < ApplicationController

  def index
    @local_adventures = []
    @foreign_adventures = []
    Adventure.all.each do |ad|
      if ad.is_local?
        @local_adventures << ad
      elsif !ad.is_local?
        @foreign_adventures << ad
      end
    end
  end

  def new
    @adventure = Adventure.new
  end

  def create
    new_adventure = params.require(:adventure).permit(:title, :author)
    adventure = Adventure.create(new_adventure)
    if adventure
      redirect_to adventure
    else
      render :new
    end
  end

  def show
    @adventure = Adventure.find(params[:id])
    @start = @adventure.pages.where(:name => "start")
  end

end
