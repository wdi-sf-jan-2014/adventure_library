class AdventuresController < ApplicationController
  def index
  @adventure = Adventure.all  
  end

  def new
  @adventure = Adventure.new
  end

  def create
  @adventure = Adventure.create(params[:adventure].permit(:title, :author, :guid, :pages_attributes =>[:name, :text]))
  redirect_to "/adventures/#{@adventure.id}"
  end

  def show
  @adventure = Adventure.find(params[:id]) 
  end

  def edit
  @adventure = Adventure.find(params[:id])
  @page = @adventure.pages.first.id  
  end

  def update
  @adventure = Adventure.find(params[:id])   
  @adventure.update_attributes(params[:adventure].permit(:title, :author))
  redirect_to "/adventures/#{@adventure.id}"
  end

  def destroy
  @adventure = Adventure.find(params[:id])
  @adventure.destroy
  redirect_to adventures_path
  end

end
