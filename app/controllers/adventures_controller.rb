class AdventuresController < ApplicationController
  def index
@adventures = Adventure.all
    @local_adventures = Adventure.where(library_id: nil)
    respond_to do |f|
      f.html
      f.json {render :json => {"adventures" => @local_adventure.as_json(except: :id, include: :pages)}}
    end
  end
  
  def new
    @adventure = Adventure.new
    @guid = SecureRandom.urlsafe_base64(10)
  end

  def create
    new_adventure = params.require(:adventure).permit(:title, :guid, :author, :pages_attributes => [:text, :name])
    @local_adventure = Adventure.create(new_adventure)
    redirect_to new_adventure_page_path(@local_adventure)

  end

  def show
    id = params[:id]
    @adventure = Adventure.find(id)

  end

  def edit
  end

  def update
  end

  def destroy
  end
end
