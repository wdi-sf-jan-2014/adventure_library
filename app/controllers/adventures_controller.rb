class AdventuresController < ApplicationController

  def index
    @local_adventures = []
    @foreign_adventures = []
    Adventure.all.each do |ad|
      if ad.is_local?
        @local_adventures << ad 
      else
        @foreign_adventures << ad
      end
    end
    respond_to do |f|
      f.html { render :index }
      f.json { render :json => {:adventures => @local_adventures.as_json(only: [:title, :author, :guid, :updated_at], include: { :pages => {only: [:name, :text]} })} }
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

  def edit
    @adventure = Adventure.find(params[:id])
  end

  def update
    adventure = Adventure.find(params[:id])
    update_adv = params.require(:adventure).permit(:title, :author, :pages_attributes => [:name, :text])
    if adventure.is_local?
      adventure.update_attributes(update_adv)
    end
    redirect_to adventure_path(adventure.id)
  end

end
