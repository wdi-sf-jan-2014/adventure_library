class AdventuresController < ApplicationController
  def index
    @adventure = Adventure.all
    respond_to do |f|
      f.html
      f.json {render :json => @adventure}
    end
  end
  
  def new
    @adventure = Adventure.new
    @page = Page.new
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
