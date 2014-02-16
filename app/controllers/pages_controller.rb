class PagesController < ApplicationController
  def index
  end

  def show
    @adventure = Adventure.find_by(:adventure_id)
    @
  end

  def new
    @page = Page.new
  end

  def create

  end

  def destroy
  end

  def edit
  end

  def update
  end
end
