class AdventuresController < ApplicationController

  def index
    @adventures = Adventure.all
    @local_adventures = Adventure.where(:library_id => nil)
    @foreign_adventures = Adventure.where("library_id IS NOT NULL")
    respond_to do |f|
      f.json { render :json => {"adventures" => @local_adventures.as_json(except: :id, include: :pages)} }
      f.html 
    end
  end

  def new
    @adventure = Adventure.new
    # @page = @adventure.pages
  end

  def create 
    adventure = params.require(:adventure).permit(:title, :author, :pages_attributes=>[:name, :text])
    @adventure = Adventure.create!(adventure)
    @adventure.guid = SecureRandom.urlsafe_base64(10)
    redirect_to new_adventure_page_path(@adventure)
  end

  def show
    @adventure = Adventure.find(params[:id])
    @page = @adventure.pages.find_by_name("start")
  end

  def edit
    @adventure = Adventure.find(params[:id]) 
  end

  def update
    update_adventure = params.require(:adventure).permit(:title)
    adventure = Adventure.find(params[:id])
    adventure.update_attributes(update_adventure)
    redirect_to adventure_path
  end

  def destroy
    @adventure = Adventure.find(params[:id]).destroy
    redirect_to adventures_path
  end

end
