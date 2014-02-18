class AdventuresController < ApplicationController
  
  def index
    @library = Library.new
    @adventures = Adventure.where(library_id: nil) 
    @libraries_adventures = Adventure.all - @adventures
    respond_to do |f|
      f.html
      f.json { render json: { adventures: @adventures.as_json(include: { pages: { only: [:name, :text] }} )} } 
    end
  end

  def new
    @adventure = Adventure.new 
    8.times { @adventure.pages.build }
  end

  def create
    new_adventure = params.require(:adventure).permit(:title, :author, pages_attributes: [:name, :text])
    @adventure = Adventure.create(new_adventure)
    redirect_to adventures_path
  end
  
end

