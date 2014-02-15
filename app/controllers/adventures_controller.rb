class AdventuresController < ApplicationController

  def new
    guid = params.require(:adventure)[:guid]
    @adventure = Adventure.new(guid: guid)
    Worker.perform_async(@adventure.guid)

    respond_to do |f|
      f.html { redirect_to adventure_path(@adventure) }
      f.json { render :json => @advneture }
    end
  end

  def edit
    @adventure = Adventure.find(params[:guid])
    f.html
    f.json {render :json => }
  end

  def update
  end

  def index
  end

  def show
    @adventure = Adventure.find(params[:guid])
    @pages = @adventure.pages
    respond_to do |f|
      f.html { redirect_to adventure_path(@adventure) }
      f.json { render :json => @adventure.as_json(include: :pages)}
    end
  end

  def create
    guid = params.require(:adventure)[:guid]
    @adventure = Adventure.create(guid: guid)
    Worker.perform_async(@adventure.guid)

    respond_to do |f|
      f.html { redirect_to adventure_path(@adventure) }
      f.json { render :json => @adventure }
    end
  end

  def delete
  end

end
