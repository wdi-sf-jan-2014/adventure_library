class AdventuresController < ApplicationController

  def index
    # libraries = JSON.parse(Typhoeus.get("http://adventures-with-raphael.herokuapp.com/libraries.json").body)['libraries']
    AdventuresWorker.perform_async("http://adventures-with-raphael.herokuapp.com/")
    @all_adventures = Adventure.all
    @adventures = Adventure.where(library_id: nil)
    @other_adventures = Adventure.where(library_id: !nil)
    respond_to do |f|
      f.html
      f.json {render :json => {adventures: @adventures.as_json(:include => :pages)}}
    end
  end

  def new
    @adventure = Adventure.new
    respond_to do |f|
      f.html
      f.json {render :json => {:error => "No stories 'ere, lad"}, :status => 404}
    end
  end

  def create
    new_adventure = Adventure.create(params.require(:adventure).permit(:title, :author, :guid, :pages_attributes => [:name, :text]))
    flash[:success] = "New tapestry woven: #{new_adventure.title}"
    redirect_to adventures_path
  end

  def edit
  end

  def update
  end

  def show
    @adventure = Adventure.find(params[:id])
  end

end