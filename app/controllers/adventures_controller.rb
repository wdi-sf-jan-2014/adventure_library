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

  end

  def create
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
