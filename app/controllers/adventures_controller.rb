class AdventuresController < ApplicationController

  def index
    @local_adventures = []
    @foreign_adventures = []
    Adventure.all.each do |ad|
      ad.is_local? ? @local_adventures << ad : @foreign_adventures << ad
    end
    respond_to do |f|
      f.html { render :index }
      f.json { render :json => {:adventures => @local_adventures.as_json(except: [:id, :library_id], include: { :pages => {except: :id} })} }
    end
  end

  def new
    @adventure = Adventure.new
  end

  def create
    new_adventure = params.require(:adventure).permit(:title, :author, :pages_attributes => [:name, :text] )
    adventure = Adventure.new(new_adventure)
    if adventure.save
      redirect_to adventure_path(adventure.id)
    else
      render :new
    end
  end

  def show
    @adventure = Adventure.find(params[:id])
    @start_page = @adventure.pages.find_by(name: "start")
  end

end
