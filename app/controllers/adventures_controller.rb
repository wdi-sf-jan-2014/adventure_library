class AdventuresController < ApplicationController

  def index
    @adventures = Adventure.all
        @local_adventures = Adventure.where(library_id: nil)
        respond_to do |f|
        f.html 
        f.json { render :json => {:adventures => @local_adventures}.to_json(:include => :pages)}
    end
  end

  def new
    @adventure = Adventure.new
  end

  def create
    new_adventure=params.require(:adventure).permit(:title, :author, :guid, pages_attributes: [ :name, :text ])
    adventure=Adventure.create(new_adventure)
    redirect_to adventure_path(adventure.id)
  end

  def show
    id = params[:id]
    @adventure = Adventure.find(id)
         @pages = @adventure.pages
         respond_to do |f|
        f.html 
        f.json { render :json => @adventure.to_json(:include => :pages)}
      end
  end

  def edit
    id = params[:id]
    @adventure = Adventure.find(id)
  end

  def update
    id = params[:id]
    updated_info = params.require(:adventure).permit(:title, :author, :guid, pages_attributes: [ :name, :text ])
    @adventure = Adventure.find(id)
    @adventure.update_attributes(updated_info)
    redirect_to adventure_path(@adventure.id)
  end
end
