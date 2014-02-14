class AdventuresController < ApplicationController

  def index
    @adventures = Adventure.all
    local_adventures = Adventure.where(:library_id => nil)
    respond_to do |f|
      f.html
      f.json { render :json => {"adventures" => local_adventures.as_json(except: :id, include: :pages)} }
    end

    # local_adventures = Adventure.find_local_adventures(@adventures)
    # render :json => {"adventures" => local_adventures}
  end

  def new
  end

  def create
  end

  def update
  end

  def show
    @adventure = Adventure.all.find(params:id).pages
    respond_to do |f|
        f.json {render :json => {"adventures" => @adventures} }
      end
  end

  def edit
  end

  def destroy
  end
end
