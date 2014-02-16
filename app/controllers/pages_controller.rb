class PagesController < ApplicationController
  
  def new
    @page = @parent.pages.build
  end

  def create
    @page = @parent.pages.build(params[:pages])
  end

  def show
  end

  def edit
  end

  def update
  end
end