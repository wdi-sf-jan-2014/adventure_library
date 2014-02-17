class AdventuresController < ApplicationController
  def index
    @library = Library.new
    @adventures = Adventure.all
    respond_to do |f|
      f.html
      f.json { render :json => @adventures.as_json(include: :pages) }
    end
  end

  def show
    @page = Adventure.find(params[:id]).pages.find_by(:name => "start")
  end

  def new
    @adventure = Adventure.new
    @adventure.guid = SecureRandom.urlsafe_base64(10)
  end

  def create
    adventure_params = params.require(:adventure).permit(:title, :author)
    adventure = Adventure.create(adventure_params)
    redirect_to adventure_path(adventure.id) + '/pages'
  end
end
