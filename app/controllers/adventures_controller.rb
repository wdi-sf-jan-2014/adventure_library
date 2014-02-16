class AdventuresController < ApplicationController


  def index
    @adventures = Adventure.all
    @local_adventures = Adventure.where(library_id: nil)

    respond_to do |format|
      format.html
      format.json { render json: {adventures: @local_adventures.as_json(
                                  except: [:id, :library_id],
                                  include: {:pages => {except: :id}})} }
    end
  end

  def new
    @adventure = Adventure.new
  end

  def create
    new_adventure = params.require(:adventure).permit(:title, :author, :pages_attributes=>[:name, :text])
    adventure = Adventure.create(new_adventure)
    redirect_to adventure
  end

  def show
    adv_id = params[:id]
    @adventure = Adventure.find(adv_id)
    pages = @adventure.pages
    @start = pages.find_by name: "start"
  end
  
end
