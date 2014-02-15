class AdventuresController < ApplicationController
  def index
    @adventure = Adventure.all
    @local_adventure = Adventure.where(:library_id => nil)
    respond_to do |f|
      f.html
      f.json {render :json => {"adventures" => @local_adventure.as_json(except: :id, include: :pages)}}
    end
  end
  
  def new
    @adventure = Adventure.new
    @guid = SecureRandom.urlsafe_base64(10)
  end

  def create
    binding.pry
    new_adventure = params[:adventure].require(:title, :guid, :author, page_attributes: [:title, :name])
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
