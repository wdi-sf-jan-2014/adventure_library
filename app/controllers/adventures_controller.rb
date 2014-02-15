class AdventuresController < ApplicationController

  def index 
    @local_adventures = Adventure.all

  end 

  def new 
    @local_adventure = Adventure.new
    # @pages = @local_adventure.pages
  end 

  def show 
    @local_adventure = Adventure.find(params[:id])
    # @pages = @adventure.pages
  #   @first_page = @local_adventure.pages.find_by_name("start")
  end 

  def create 
    new_adventure = params.require(:adventure).permit(:title, :author, :pages_attributes => [:name, :text])
    new_adventure["guid"] = SecureRandom.urlsafe_base64(10)
    binding.pry
    @local_adventure = Adventure.create(new_adventure)
    redirect_to adventures_path
  end 

end



