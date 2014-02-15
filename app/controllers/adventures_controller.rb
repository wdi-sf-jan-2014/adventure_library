class AdventuresController < ApplicationController

  def index
    @adventures = Adventure.all
    # @libraries = Library.all
  end

  def new
    @adventure = Adventure.new
  end

  def create
    
    adventure = params.require(:adventure).permit(:title, :author)
    @adventure = Adventure.new(adventure)
    @adventure["guid"] = SecureRandom.urlsafe_base64(10) #why does this not save?
    binding.pry
    @adventure.save

    redirect_to adventures_path

  end

  def show
    @adventure = Adventure.find(params[:id])
    @first_page = @adventure.pages.find_by_name("start")

  end

  def edit
  end

  def update
  end

  def destroy
  end



end