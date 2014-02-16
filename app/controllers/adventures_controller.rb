class AdventuresController < ApplicationController
  def index
  @adventure = Adventure.all 
    respond_to do |f|
    f.html
    f.json { render :json => @adventure.as_json(include: :pages)} 
    end
  end

  def new
  @adventure = Adventure.new
  end

  def create
  adventure = Adventure.create(params[:adventure].permit(:title, :author, :guid, :pages_attributes =>[:name, :text])) 
  redirect_to "/adventures/#{adventure.id}/pages/new"
  end

  def show
  @adventure = Adventure.find(params[:id]) 
    respond_to do |f|
      f.html
      f.json { render :json => @adventure.as_json(include: :pages)}
    end
  end

  def edit
  @adventure = Adventure.find(params[:id])
  end

  def update
  adventure = Adventure.find(params[:id])   
  adventure.update_attributes(params[:adventure].permit(:title, :author, :guid, :pages_attributes =>[:name, :text]))
  redirect_to "/adventures/#{@adventure.id}"
  end

  def destroy
  adventure = Adventure.find(params[:id])
  adventure.destroy
  redirect_to adventures_path
  end

end
