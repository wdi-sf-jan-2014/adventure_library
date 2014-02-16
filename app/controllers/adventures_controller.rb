class AdventuresController < ApplicationController
  
  def index
  @adventure = Adventure.all
  my_library = Library.first 
    respond_to do |f|
    f.html
    f.json { render :json => my_library.to_json(only: [:url, :name], include: [ adventures:
      {only: [:title, :author, :created_at, :updated_at, :guid], include: 
      [ pages: {only: [:name, :text]}]}])}
    end
  end

  def new
  @adventure = Adventure.new
  end

  def create
  library = Library.create!(url: "/adventures", name: "Yutaka's library")
  adventure = library.adventures.create!(params[:adventure].permit(:title, 
    :author, :guid, :pages_attributes =>[:name, :text])) 
  redirect_to "/adventures/#{adventure.id}/pages/new"
  end

  def show
  @adventure = Adventure.find(params[:id]) 
  end

  def edit
  @adventure = Adventure.find(params[:id])
  end

  def update
  adventure = Adventure.find(params[:id])   
  adventure.update_attributes(params[:adventure].permit(:title, 
    :author, :guid, :pages_attributes =>[:name, :text]))
  redirect_to "/adventures/#{@adventure.id}"
  end

  def destroy
  adventure = Adventure.find(params[:id])
  adventure.destroy
  redirect_to adventures_path
  end

end
