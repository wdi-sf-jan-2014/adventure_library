class AdventuresController < ApplicationController
  def index
    @adventures = Adventure.all
    @local_adventure = Adventure.where(library_id: nil)
    @foreign_adventure = Adventure.where.not(library_id: nil)
    respond_to do |f|
      f.html 
       f.json {render :json => {:adventures =>@local_adventure.as_json(
        include: {pages: {except: [:id]} } ,
          except: [:id] )}}
     end
  end

  def new
  @adventure = Adventure.new()
  @guid = SecureRandom.urlsafe_base64(10)
  end

  def create
    new_adventure = params.require(:adventure).permit(:title, :author, :pages_attributes => [:name, :text])
    if new_adventure["guid"].exist?
    else
      new_adventure["guid"] = @guid
    end
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
