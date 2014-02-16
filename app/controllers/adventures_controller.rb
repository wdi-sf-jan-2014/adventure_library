class AdventuresController < ApplicationController
  def index
    @adventures = Adventure.all
  end

  def new
  @adventure = Adventure.new()
  @guid = SecureRandom.urlsafe_base64(10)
  end

  def create
    new_adventure = params.require(:adventure).permit(:title, :author, :guid, :pages_attributes => [:name, :text])
    @adventure = Adventure.create(new_adventure)
    redirect_to new_adventure_page_path(@adventure)
  end

  def show
    @adventure = Adventure.find(params[:id])
    
  end

  def edit
  end

  def delete
  end

  def update
  end
end
