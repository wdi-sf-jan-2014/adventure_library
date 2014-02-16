class AdventuresController < ApplicationController

  def index
    @adventures = Adventure.all
    @local_adventure = Adventure.where(library_id: nil)
    @foreign_adventure = Adventure.where.not(library_id: nil)

    respond_to do |f|
      f.html 
      f.json { render :json => {:adventures => @local_adventure.as_json( only: [:title, :author, :library_id, :guid], 
        include: [ {pages: { only: [:name, :text, :adventure_id] } }])} }
      
    end
  end

  def new
    @adventure = Adventure.new
  end

  def create
    
    adventure = params.require(:adventure).permit(:title, :author)
    @adventure = Adventure.new(adventure)
    @adventure["guid"] = SecureRandom.urlsafe_base64(10) 
    # binding.pry
    @adventure.save

    redirect_to adventures_path

  end

  def show
    @adventure = Adventure.find(params[:id])
    @first_page = @adventure.pages.find_by_name("start")

  end

  def edit
  end

  def update
  end

  def destroy
    @adventure = Adventure.find(params[:id])
    @adventure.destroy
    redirect_to adventures_path
  end



end