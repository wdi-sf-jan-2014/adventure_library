class AdventuresController < ApplicationController

  def index
    @adventures = Adventure.all
      local_adventures = []
    @adventures.each do |adventure|
      if adventure.library_id == nil
        local_adventures.push(adventure)
      end
    end
    respond_to do |f|
      f.json { render :json => {"adventures" => local_adventures.as_json(include: :pages)} }
    end
    #   @adventure = Adventure.all
    # respond_to do |f|
    #     f.json {render :json => {"adventures" => @adventures.as_json(include: :pages)} }
    #   end
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
