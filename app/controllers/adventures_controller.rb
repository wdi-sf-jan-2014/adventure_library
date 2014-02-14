class AdventuresController < ApplicationController
  def index
    @adventures = Adventure.all
    respond_to do |f|
        f.json {render :json => {"adventures" => @adventures}}
      end
  end

  def new
  end

  def create
  end

  def update
  end

  def show
  end

  def edit
  end

  def destroy
  end
end
