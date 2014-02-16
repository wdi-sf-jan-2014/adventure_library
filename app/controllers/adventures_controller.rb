class AdventuresController < ApplicationController

  def new
    @adventure = Adventure.new
  end

  def edit
    @adventure = Adventure.find(params[:id])
    f.html
   # f.json {render :json => }
  end

  def update
    @adventure = Adventure.find(params[:id])
  end

  def index
    @adventures = Adventure.all
  end

  def show
    @adventure = Adventure.find(params[:id])
    @pages = @adventure.pages
    respond_to do |f|
      f.html { redirect_to adventure_path(@adventure) }
      f.json { render :json => @adventure.as_json(include: :pages)}
    end
  end

  def create
    id = params.require(:adventure)[:id]
    @adventure = Adventure.create(id: id)
    LibrariesWorker.perform_async(@adventure.id)

    respond_to do |f|
      f.html { redirect_to adventure_path(@adventure) }
      f.json { render :json => @adventure }
    end
  end

end

