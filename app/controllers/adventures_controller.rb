class AdventuresController < ApplicationController
  def index
    @adventure = Adventure.all
    respond_to do |format|
      format.html
      format.json { render json: @adventure }
    end
  end

  def edit
  end

  def show
    @adventure = Adventure.find(params[:id])
    @page = @adventure.pages.find_by(name: "start")
    respond_to do |format|
      format.html
      format.json { render json: @adventure }
    end
  end

  def new
    @adventure = Adventure.new
    @adventure.pages.build
    @page = Page.new
  end

  def create
    adventure_params = params.require(:adventure).permit(:title, :author, :pages_attributes => [:name, :text])

    @adventure = Adventure.new(adventure_params)
    @adventure.save

    redirect_to adventures_path
  end

  def update

  end

  def destroy
    @adventure = Adventure.find(params[:id])
    @adventure.destroy
    redirect_to root_path
  end
end
