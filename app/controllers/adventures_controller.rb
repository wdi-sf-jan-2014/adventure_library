class AdventuresController < ApplicationController
  include PagesHelper
  def index
    @adventures = Adventure.all
    local_adventures = Adventure.where(:library_id => nil)
    respond_to do |f|
      f.html
      f.json { render :json => {"adventures" => local_adventures.as_json(except: :id, include: :pages)} }
    end
  end

  def new
    @adventure = Adventure.new
    @guid = SecureRandom.urlsafe_base64(10)
  end

  def create
    new_adventure = Adventure.create(adventure_params)
    redirect_to adventure_path(new_adventure)
  end

  def update
  end

  def show
    @adventure = Adventure.find(params[:id])
    @page = @adventure.pages.find_by_name("start")
    respond_to do |f|
        f.html 
        f.json {render :json => {"adventures" => @adventures} }
      end
  end

  def edit
  end

  def destroy
  end

  private

  def adventure_params
    params.require(:adventure).permit(:title, :author, :guid, :pages_attributes=>[:name, :text])
  end
end
