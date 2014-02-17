class AdventuresController < ApplicationController
  def new
    @adventure = Adventure.new
    @page = Page.new
    # respond_to do |f|
    #   f.html
    #   f.json { render :json => {error: 'Cannot access new page, try create'}, status: 404 }
    # end
  end

  def show
    #binding.pry
    @adventure = Adventure.find(params[:id])
    # respond_to do |f|
    #   f.html
    #   f.json { render :json => @adventue.as_json}
    # end
  end

  def index
    @library = Library.new
    @adventures = Adventure.all
    # AdventuresWorker.perform_async(@adventures)
    respond_to do |f|
      f.html
      f.json { render json: @adventures.as_json(include: :pages), status: 200}
    end
  end

  def create
    new_adventure = params.require(:adventure).permit(:title, :author)
    new_adventure[:guid] = SecureRandom.urlsafe_base64(10)
    @adventure = Adventure.create(new_adventure)
  end
end
