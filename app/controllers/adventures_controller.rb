class AdventuresController < ApplicationController

  def index
    @adventures = Adventure.all
    @local_adventures = Adventure.where(:library_id => nil)
    respond_to do |f|
      f.json { render :json => {"adventures" => @local_adventures.as_json(except: :id, include: :pages)} }
      f.html 
    end
  end

  def new
    @adventure = Adventure.new
  end

  def create 
    adventure = params.require(:adventure).permit(:title, :author, :pages_attributes =>[:name, :text])
    @adventure = Adventure.create!(adventure)
    @adventure.guid = SecureRandom.urlsafe_base64(10)
    @adventure.save
    redirect_to @adventure
  end

  def show
    @adventure = Adventure.find(params[:id])
    @page = @adventure.pages.first
  end

  def edit
  end

end
