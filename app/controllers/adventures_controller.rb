class AdventuresController < ApplicationController
  def index
  @adventure = Adventure.all  
  end

  def new
  @adventure = Adventure.new
  end

  def create
  @adventure = Adventure.create(params[:adventure].permit(:title, :author))
  redirect_to "/adventures/#{@adventure.id}"
  end

  def show
  @adventure = Adventure.find(params[:id]) 
  end

  def edit
  @adventure = Adventure.find(params[:id])  
  end

  def update
  @adventure = Adventure.create(params[:adventure].permit(:title, :author))
  redirect_to "/adventures/#{@adventure.id}"
  end

  def destroy
  @adventure = Adventure.find(params[:id])
  @adventure.destroy
  redirect_to adventures_path
  end

end
